#!/bin/bash

# Number guess game
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
#echo $($PSQL "TRUNCATE games, users;")

echo Enter your username: 
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]; then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  GAMES=$($PSQL "SELECT COUNT(game_id), MIN(guesses) FROM games WHERE user_id=$USER_ID")
  echo $GAMES | while IFS="|" read N_GAMES BEST_GAME; do
    echo -e "Welcome back, $USERNAME! You have played $N_GAMES games, and your best game took $BEST_GAME guesses.\n"
  done
fi

NUMBER=$(( RANDOM % 1000 + 1 ))
COUNTER=1
GUESS=0

#echo "Right number: $NUMBER"
echo "Guess the secret number between 1 and 1000:"
read GUESS

while [[ $GUESS != $NUMBER ]]; do
  COUNTER=$(( COUNTER + 1 ))
  if [[ $GUESS =~ ^[0-9]+$ ]]; then
    if [[ $GUESS > $NUMBER ]]; then
      echo -e "\nIt's lower than that, guess again:"
      read GUESS
    elif [[ $GUESS < $NUMBER ]]; then
      echo -e "\nIt's higher than that, guess again:"
      read GUESS
    fi

  else
    echo -e "\nThat is not an integer, guess again:"
    read GUESS
  fi
done

echo "You guessed it in $COUNTER tries. The secret number was $NUMBER. Nice job!"
INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $COUNTER)")

