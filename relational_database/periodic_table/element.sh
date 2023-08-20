#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
	echo "Please provide an element as an argument."
else
	COLUMNS="atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius"
	
	if [[ $1 =~ [0-9]+ ]]
	then
		WHERE_CONDITION="atomic_number = $1"
	else
		WHERE_CONDITION="symbol = '$1' OR name = '$1'"
	fi

	SEARCHED_ELEMENT=$($PSQL "SELECT $COLUMNS FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE $WHERE_CONDITION;")
	
	if [[ -z $SEARCHED_ELEMENT ]]
	then
		echo "I could not find that element in the database."
	else
		ATOMIC_NUMBER=$(echo $SEARCHED_ELEMENT | sed -r 's/(.+?)\|.+?\|.+?\|.+?\|.+?\|.+?\|.+?/\1/')
		NAME=$(echo $SEARCHED_ELEMENT | sed -r 's/.+?\|(.+?)\|.+?\|.+?\|.+?\|.+?\|.+?/\1/')
		SYMBOL=$(echo $SEARCHED_ELEMENT | sed -r 's/.+?\|.+?\|(.+?)\|.+?\|.+?\|.+?\|.+?/\1/')
		TYPE=$(echo $SEARCHED_ELEMENT | sed -r 's/.+?\|.+?\|.+?\|(.+?)\|.+?\|.+?\|.+?/\1/')
		ATOMIC_MASS=$(echo $SEARCHED_ELEMENT | sed -r 's/.+?\|.+?\|.+?\|.+?\|(.+?)\|.+?\|.+?/\1/')
		MELTING_POINT=$(echo $SEARCHED_ELEMENT | sed -r 's/.+?\|.+?\|.+?\|.+?\|.+?\|(.+?)\|.+?/\1/')
		BOILING_POINT=$(echo $SEARCHED_ELEMENT | sed -r 's/.+?\|.+?\|.+?\|.+?\|.+?\|.+?\|(.+?)/\1/')

		echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
	fi
fi