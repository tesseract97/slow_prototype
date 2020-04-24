#!/bin/bash


#docker executed the curl command on the container slow_control
#the curl command sends an http request using the admin username and password with the local machine
#the port is the access point for CouchDB
#_all_dbs is a variable that specifies all databases 
DATABASE_NAMES ="docker exec slow_control curl -X GET http://EXO:x3n0ntpc@127.0.0.1:5984/_all_dbs"

#response executes the command
RESPONSE=`$DATABASE_NAMES`

#a print statement makes the database names visible to the user
echo $RESPONSE


exit 0