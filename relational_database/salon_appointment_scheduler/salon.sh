#!/bin/bash

PSQL="psql -U freecodecamp -d salon -A -t -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  # if message passed
  if [[ ! -z $1 ]]
  then
    echo -e "\n$1"
  fi

  # get all services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")

  # display formated services
  echo $SERVICES | sed -r 's/\|/,/g; s/ /\n/g' | while IFS="," read SERVICE_ID NAME
  do
    # display each service
    echo "$SERVICE_ID) $NAME"
  done

  # accept service id
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ [0-9]+ ]]
  then
    MAIN_MENU "Option is not a valid number"
  else
    REGISTER_APPOINTMENT $SERVICE_ID_SELECTED
  fi
}

REGISTER_APPOINTMENT() {
  SERVICE_ID_NAME=$($PSQL "SELECT service_id, name FROM services WHERE service_id = '$SERVICE_ID_SELECTED';")

  SERVICE_ID_SELECTED=$(echo $SERVICE_ID_NAME | sed -r 's/(.*)\|.*/\1/')

  SERVICE_NAME_SELECTED=$(echo $SERVICE_ID_NAME | sed -r 's/.*\|(.*)/\1/')

  if [[ -z $SERVICE_ID_SELECTED ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_ID_NAME=$($PSQL "SELECT customer_id, name FROM customers WHERE phone = '$CUSTOMER_PHONE';")

    CUSTOMER_ID=$(echo $CUSTOMER_ID_NAME | sed -r 's/(.*)\|.*/\1/')

    CUSTOMER_NAME=$(echo $CUSTOMER_ID_NAME | sed -r 's/.*\|(.*)/\1/')

    if [[ -z $CUSTOMER_ID ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")

      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    fi

    echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
    read SERVICE_TIME

    APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

    echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME.\n"
  fi
}

MAIN_MENU