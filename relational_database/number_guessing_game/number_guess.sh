#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"

read USERNAME

if [[ ${#USERNAME} -gt 22 ]]
then
  echo "Username cannot exceed 22 characters!"
elif [[ ${#USERNAME} -lt 4 ]]
then
  echo "Username should be atleast 4 characters!"
else
  USER_IN_DB=$($PSQL "SELECT games_played, best_guesses FROM guesses WHERE username = '$USERNAME';")

  if [[ -z $USER_IN_DB ]]
  then
    NEW_USER_REGISTER=$($PSQL "INSERT INTO guesses(username, games_played, best_guesses) VALUES('$USERNAME', 0, 0);")

    GAMES_PLAYED=0
    BEST_GUESSES=0

    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    GAMES_PLAYED=$(echo $USER_IN_DB | sed -r 's/(.+?)\|.+?/\1/')
    BEST_GUESSES=$(echo $USER_IN_DB | sed -r 's/.+?\|(.+?)/\1/')

    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESSES guesses."
  fi

  SECRET_NUMBER=$((RANDOM % 1000))
  GUESSES=0
  GUESS=10000

  while [[ $GUESS -ne $SECRET_NUMBER ]]
  do
    if [[ $GUESSES -eq 0 ]]
    then
      echo "Guess the secret number between 1 and 1000:"
    elif [[ $GUESS -gt $SECRET_NUMBER && $GUESS -ne 10000 ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $GUESS -lt $SECRET_NUMBER && $GUESS -ne 10000 ]]
    then
      echo "It's higher than that, guess again:"
    fi
    
    ((GUESSES++))

    read GUESS
    
    if [[ ! $GUESS =~ [0-9]+ ]]
    then
      echo "That is not an integer, guess again:"
      GUESS=10000
    fi
  done

  echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

  STATUS_UPDATE="games_played = $(($GAMES_PLAYED + 1))"

  if [[ $BEST_GUESSES -eq 0 || $GUESSES -lt $BEST_GUESSES ]]
  then
    STATUS_UPDATE="$STATUS_UPDATE, best_guesses = $GUESSES"
  fi

  USER_GAME_STATUS_UPDATE=$($PSQL "UPDATE guesses SET $STATUS_UPDATE WHERE username = '$USERNAME';")
fi