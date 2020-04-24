#!/bin/bash

db_name=$1


#docker executed the curl command on the container slow_control
#the curl command sends an http request using the admin username and password with the local machine
#the port is the access point for CouchDB
DATABASE="docker exec slow_control curl -X GET http://EXO:x3n0ntpc@127.0.0.1:5984/"
DATABASE2="${DATABASE}${db_name}"

#response executes the command
RESPONSE=`$DATABASE_NAMES`

#a print statement displays the database information
echo $RESPONSE



exit 0