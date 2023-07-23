from math import ceil
from re import findall, IGNORECASE

DAYS_OF_THE_WEEK = {
    "Monday": 0,
    "Tuesday": 1,
    "Wednesday": 2,
    "Thursday": 3,
    "Friday": 4,
    "Saturday": 5,
    "Sunday": 6
}

def add_time(start, duration, day_of_the_week=None):
    [start_hour, start_minute, am_pm, *_] = findall("^\\d{1,2}(?=:)|(?<=:)\\d{2}|[AP]M", start)
    [duration_hour, duration_minute, *_] = findall("^\\d+(?=:)|(?<=:)\\d{2}$", duration)

    start_hour = int(start_hour)
    start_minute = int(start_minute)
    
    duration_hour = int(duration_hour)
    duration_minute = int(duration_minute)

    duration_span = duration_hour // 12

    if duration_hour > 12:
        duration_hour = duration_hour - (duration_span * 12)

    total_hour = start_hour + duration_hour
    total_minute = start_minute + duration_minute
    total_am_pm = am_pm

    if total_minute > 59:
        total_hour += 1
        total_minute = total_minute - 60

    days_jumped = 0

    if duration_span > 0:
        if duration_span % 2 != 0:
            if total_am_pm == "AM":
                total_am_pm = "PM"
            else:
                total_am_pm = "AM"
                days_jumped += 1
        
        days_jumped += (duration_span * 12) // 24

    if total_hour > 11:
        if total_hour > 12:
            total_hour = total_hour - 12
        
        if total_am_pm == "AM":
            total_am_pm = "PM"
        else:
            total_am_pm = "AM"
            days_jumped += 1
    
    if day_of_the_week is not None:
        day_of_the_week_to_jump = days_jumped - ((days_jumped // 7) * 7)

        for day in DAYS_OF_THE_WEEK:
            day_match = findall(
                pattern=day_of_the_week,
                string=day,
                flags=IGNORECASE
            )
            
            if len(day_match) == 1:
                day_of_the_week_to_jump += DAYS_OF_THE_WEEK[day]

                if day_of_the_week_to_jump  > 6:
                    day_of_the_week_to_jump = 7 - day_of_the_week_to_jump
                break
        
        for (day, idx) in DAYS_OF_THE_WEEK.items():
            if idx == day_of_the_week_to_jump:
                day_of_the_week = day
                break

    return "%s:%s%s %s%s%s" % (
        total_hour,
        "0" \
            if total_minute < 10 \
            else "",
        total_minute,
        total_am_pm,
        f", {day_of_the_week}" \
            if day_of_the_week is not None \
            else "",
        " (next day)" \
            if days_jumped == 1 \
            else f" ({days_jumped} days later)" \
                if days_jumped > 1 \
                else ""
    )


# less verbose test suite
def tester(tests: list):
    for test in tests:
        try:
            assert test[1].find(test[0]) != -1
            result = True
        except AssertionError:
            result = False
        print(f"{result}\t| {test[0]}    {test[1]}")

tester([
    (add_time("3:00 PM", "3:10"), "6:10 PM"),
    (add_time("11:30 AM", "2:32", "Monday"), "2:02 PM, Monday"),
    (add_time("11:43 AM", "00:20"), "12:03 PM"),
    (add_time("10:10 PM", "3:30"), "1:40 AM (next day)"),
    (add_time("11:43 PM", "24:20", "tueSday"), "12:03 AM, Thursday (2 days later)"),
    (add_time("6:30 PM", "205:12"), "7:42 AM (9 days later)"),
    (add_time("8:16 PM", "466:02"), "6:18 AM (20 days later)"),
    (add_time("8:16 PM", "466:02", "tuesday"), "6:18 AM, Monday (20 days later)"),
    (add_time("2:59 AM", "24:00"), "2:59 AM (next day)"),
    (add_time("2:59 AM", "24:00", "saturDay"), "2:59 AM, Sunday (next day)")
])