#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to my Salon, how can i help you?\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id,name FROM services ORDER BY service_id")
  
  # Check all available services
  if [[ -z $AVAILABLE_SERVICES ]]
  then
    echo "Sorry, we dont have any service available right now"
  else
    echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
      do
        echo "$SERVICE_ID) $SERVICE_NAME"
      done
      # if Input service ID is not a number
      read SERVICE_ID_SELECTED
      if [[ !SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
      then
        # Send to main Menu
        MAIN_MENU "That is not a number."
      else
        SERVICE_ID_RESULT=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
        if [[ -z $SERVICE_ID_RESULT ]]
        then
          MAIN_MENU "I could not find that service. What would you like today?"
        else
          # Prompt for phone number
          echo -e "\nWhat's your phone number?"
          read CUSTOMER_PHONE
          CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
          if [[ -z $CUSTOMER_NAME ]]
          then
            # if phone record doesnt exist: Get new customer name
            echo -e "\nI don't have a record for that phone number, what's your name?"
            read CUSTOMER_NAME
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
          fi
          # GET customer_id 
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE';")
          # Get name of Service
          SERV_NAME=$($PSQL "SELECT name FROM services WHERE service_id= $SERVICE_ID_RESULT")

          # Prompt for time of appointment
          echo -e "\nWhat time would you like your $SERV_NAME, $CUSTOMER_NAME"
          read SERVICE_TIME
          if [[ $SERVICE_TIME ]]
          then
            # Insert appointment if there is any input
            INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_RESULT,'$SERVICE_TIME')")
            if [[ $INSERT_APPOINTMENT_RESULT ]]
            then
              echo -e "\nI have put you down for a $SERV_NAME at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
            fi
          fi
        fi      
      fi
  fi
}

CUT_HAIR(){
  echo cut
}
DYE_HAIR(){
  echo dye
}

STRAIGHTEN_HAIR(){
  echo straight
}

EXIT(){
  echo -e "\nThank you for trusting your hair with us.\n"
}

MAIN_MENU
