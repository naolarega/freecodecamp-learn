#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "TRUNCATE TABLE games, teams;"

INSERT_GAME="INSERT INTO games(year, round, winner_id, opponenet_id, winner_id, winner_goals, opponent_goals) VALUES"

GAMES=""

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR == year ]]
  then
    continue
  fi

  WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")

  if [[ -z $WINNER_TEAM_ID ]]
  then
    $PSQL "INSERT INTO teams(name) VALUES('$WINNER');"
  
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
  fi

  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")

  if [[ -z $OPPONENT_TEAM_ID ]]
  then
    $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');"
  
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
  fi

  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS);"
done