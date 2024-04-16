#!/bin/bash

BASE_URL=https://192.168.64.15:8443
LOGIN_URL=$BASE_URL/auth/login/
CREATE_GAME_URL=$BASE_URL/game/

PLAYER1_USERNAME='player1'
PLAYER2_USERNAME='player2'
PLAYER1_PASSWORD='yourpassword'
PLAYER2_PASSWORD='yourpassword'
PLAYER1_COOKIES=cookies1.txt
PLAYER2_COOKIES=cookies2.txt

# Log in
LOGIN_RESPONSE1=$(curl -s -k -c $PLAYER1_COOKIES -d "username=$PLAYER1_USERNAME&password=$PLAYER1_PASSWORD" $LOGIN_URL)
LOGIN_RESPONSE2=$(curl -s -k -c $PLAYER2_COOKIES -d "username=$PLAYER2_USERNAME&password=$PLAYER2_PASSWORD" $LOGIN_URL)

# Extract CSRF
CSRF1=$(grep csrftoken $PLAYER1_COOKIES | awk -F'\t' '{print $7}')
CSRF2=$(grep csrftoken $PLAYER2_COOKIES | awk -F'\t' '{print $7}')

# Extract JWT
JWT1=$(echo "$LOGIN_RESPONSE1" | awk -F'"' '{print $4}')
JWT2=$(echo "$LOGIN_RESPONSE2" | awk -F'"' '{print $4}')

# Create game
GAME_CREATION_RESPONSE=$(curl -s -k -b $PLAYER1_COOKIES -X POST -H "X-CSRFToken: $CSRF1" $CREATE_GAME_URL)

# Join game
curl -s -k -b $PLAYER2_COOKIES -X POST -H "X-CSRFToken: $CSRF2" $CREATE_GAME_URL > /dev/null

# Extract the game's id
GAME_ID=$(echo "$GAME_CREATION_RESPONSE" | awk -F'"' '{print $4}')

EVENTSOURCE_URL=$BASE_URL/game/$GAME_ID/?token=$JWT1

# Connect to the EventSource, timeout after 5 seconds
curl -k -N -m 5 $EVENTSOURCE_URL

UPDATE_URL=$BASE_URL/game/$GAME_ID/

for i in {1..10}; do
	curl -s -k -b $PLAYER1_COOKIES -X PUT -H "Content-Type: application/json" -H "X-CSRFToken: $CSRF1" $UPDATE_URL -d '[0, 1]' > /dev/null
	sleep 0.3
done

rm $PLAYER1_COOKIES $PLAYER2_COOKIES
