/*
    1:      "I",
    4:      "IV",
    5:      "V",
    9:      "IX",
    10:     "X",
    40:     "XL",
    50:     "L",
    90:     "XC",
    100:    "C",
    400:    "CD",
    500:    "D",
    900:    "CM",
    1000:   "M"
*/

/**
 * 
 * @param {number} num 
 * @returns 
 */
function convertToRoman(num) {
    return num.toString()
        .split("")
        .map(
            (value, index, array) => {
                const digit = value * (10 ** ((array.length - index) - 1));
                if(digit >= 1 && digit < 4) {
                    return "I".repeat(digit);
                } else if(digit == 4) {
                    return "IV";
                } else if(digit >= 5 && digit < 9) {
                    return `V${"I".repeat(digit - 5)}`;
                } else if(digit == 9) {
                    return "IX";
                } else if(digit >= 10 && digit < 40) {
                    return "X".repeat(digit / 10);
                } else if(digit == 40) {
                    return "XL";
                } else if(digit >= 50 && digit < 90) {
                    return `L${"X".repeat((digit / 10) - 5)}`;
                } else if(digit == 90) {
                    return "XC";
                } else if(digit >= 100 && digit < 400) {
                    return "C".repeat(digit / 100);
                } else if(digit == 400) {
                    return "CD";
                } else if(digit >= 500 && digit < 900) {
                    return `D${"C".repeat((digit / 100) - 5)}`;
                } else if(digit == 900) {
                    return "CM";
                } else {
                    return "M".repeat(digit / 1000);
                }
            }
        )
        .join("");
}