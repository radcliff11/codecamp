#!/bin/bash

#PSQL query variable
PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

echo "Enter your username: "
read USERNAME

# Query username in DB
USERNAME_AVAIL=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

# If username is present in DB
if [[ -z $USERNAME_AVAIL ]]
then
  # First time Users, register, Users
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Active User
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games USING(user_id) WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM users INNER JOIN games USING(user_id) WHERE username='$USERNAME';")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUM=$((1 + $RANDOM % 1000))
TRIES=1
echo "Guess the secret number between 1 and 1000:"
while read GUESS
  do
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      #not integer
      echo "That is not an integer, guess again:"    
    else
      #integer: if correct guess
      if [[ $GUESS -eq $RANDOM_NUM ]]
      then
        break;
      else
        if [[ $GUESS -gt $RANDOM_NUM ]]
        then
          # Guess is greater than random num
          echo -n "It's lower than that, guess again:"
        else
          # Guess is lesser than random num
          echo -n "It's higher than that, guess again:"
        fi
      fi
    fi
    TRIES=$(( $TRIES + 1))
done

if [[ $TRIES == 1 ]]
then
  echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUM. Nice job!"
else
  echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUM. Nice job!"
fi     

USER_ID=$($PSQL "SELECT user_id FROM USERS WHERE username='$USERNAME';")
INSERT_GAME=$($PSQL "INSERT INTO games(number_guesses,user_id) VALUES($TRIES,$USER_ID);")
  

        
        

