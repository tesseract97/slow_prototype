#!/bin/bash


#first parameter is the desired database name

db_name=$1

#docker executes the curl command on the slow_control container with the admin name and password
#curl command sends http request with admin name and password to local address with CouchDB port
#the desired database name is added to the end of the command
COMMAND="docker exec slow_control curl -X PUT http://EXO:x3n0ntpc@127.0.0.1:5984/"
COMMAND2="${COMMAND}/${db_name}"

#response evaluates the command
RESPONSE=`$COMMAND2`

#the result is printed for confirmation of database creation
echo $RESPONSE


exit 0