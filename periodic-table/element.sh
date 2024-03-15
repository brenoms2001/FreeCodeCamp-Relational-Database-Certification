#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#No arguments
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."

#Input
else
  if [[ $1 =~ ^[0-9]+$ ]]; then
    ELEMENT_INFO_NUMBER=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
  else
    ELEMENT_INFO_SYMBOL=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'")
    ELEMENT_INFO_NAME=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'")
  fi

  if [[ -z $ELEMENT_INFO_NUMBER && -z $ELEMENT_INFO_SYMBOL && -z $ELEMENT_INFO_NAME ]]; then
    echo I could not find that element in the database.

  elif [[ $ELEMENT_INFO_NUMBER ]]; then
    echo $ELEMENT_INFO_NUMBER | while IFS="|" read TYPE_ID ATOMIC_NUMBER ELEMENT_SYMBOL ELEMENT_NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE; do
      echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done

  elif [[ $ELEMENT_INFO_SYMBOL ]]; then
    echo $ELEMENT_INFO_SYMBOL | while IFS="|" read TYPE_ID ATOMIC_NUMBER ELEMENT_SYMBOL ELEMENT_NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE; do
      echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done

  elif [[ $ELEMENT_INFO_NAME ]]; then
    echo $ELEMENT_INFO_NAME | while IFS="|" read TYPE_ID ATOMIC_NUMBER ELEMENT_SYMBOL ELEMENT_NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE; do
      echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi