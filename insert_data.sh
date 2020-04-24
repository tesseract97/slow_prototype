#!/bin/bash



#Timestamp is recorded and formatted to be Javascript specific
TIMESTAMP=`date +%Y-%m-%d-%T%:::z`

#temperature is taken as first parameter
TEMPERATURE=$1

#pressure is taken as second parameter
PRESSURE=$2

#JSON is constructed for cleaner code
JSON_TO_INSERT = "{\"_id\": \"${TIMESTAMP}\", \"temperature\": \"${TEMPERATURE}\", \"pressure\": \"${PRESSURE}\"}"


#docker executes the curl for slow_control container
#http request sent with admin username and password to local machine and database new_data
# -d extension specifies that data is being sent in
# The Content-Type is specified as a header
#Response takes the execution of the command

COMMAND="docker exec slow_control curl -X POST http://EXO:x3n0ntpc@127.0.0.1:5984/new_data -d \‘${JSON_TO_INSERT}\'"
COMMAND2="${COMMAND} -H \“Content-Type: application/json\” "
RESPONSE=`$COMMAND2`

#a print statement makes it more clear to the user
#the timestamp is the id of the data point for easier use
echo "Data Point Recorded in Database new_data with _id: "
echo $TIMESTAMP




exit 0
