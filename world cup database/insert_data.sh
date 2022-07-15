#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G
do
  ## Check if winner and opponent are registerd in teams database
  # register winner into teams if not registered
  TEAMS=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  if [[ $WINNER != 'winner' ]]
  then
    # Check if team is registered
    if [[ -z $TEAMS ]]
    then 
      INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      if [[ INSERT_TEAMS == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
    fi
  fi
  # register opponent into teams if not registered
  TEAMS2=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  if [[ $OPPONENT != 'opponent' ]]
  then
    # Check if team is registered
    if [[ -z $TEAMS2 ]]
    then
      INSERT_TEAM2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      if [[ $INSERT_TEAM2 == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi
  fi

  # Check the team_id from teams table to insert into games
  TEAM_ID_W=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
  TEAM_ID_O=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

  # As long as either Winner or loser are not null
  if [[ -n $TEAM_ID_W || $TEAM_ID_O ]]
  then
      if [[ $YEAR != 'year' ]] 
      then
        INSERT_GAMES=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals)
        VALUES ($YEAR, '$ROUND', $TEAM_ID_W, $TEAM_ID_O, $WINNER_G, $OPPONENT_G);")
        if [[ $INSERT_GAMES == "INSERT 0 1" ]]
        then
          echo Inserted into games $YEAR
        fi
      fi
  fi

done
