#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

# show services
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?"

SERVICES(){
  echo
  if [[ $1 ]]; then
    echo $1
  fi
  
  SERVICES_AVAILABLES="$($PSQL "SELECT * FROM services ORDER BY service_id")"
  echo "$SERVICES_AVAILABLES" | sed 's/|/ /'| while read SERVICE_ID SERVICE_NAME; do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  
  #it's a number
  if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    #searching
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_NAME ]]; then
      #not found
      SERVICES "I could not find that service. What would you like today?"
    else
      #found
      echo -e "\nWhat's your phone number? "
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

      #client not in the database
      if [[ -z $CUSTOMER_NAME ]]; then
        # register customer
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi
      
      # appoint service
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME
      APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
      if [[ $APPOINTMENT_RESULT == "INSERT 0 1" ]]; then
        echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      else
        echo -e "\nInsert failed."
      fi
    fi
      
  #Not a number
  else
    SERVICES "I could not find that service. What would you like today?"
  fi
}

SERVICES