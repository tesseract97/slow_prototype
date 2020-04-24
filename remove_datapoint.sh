#!/bin/bash


#first input is the ID
#this will be a timestamp by database notation
ID=$1


#get _rev number
#docker executes curl command for container slow_control
#curl command sends http request with admin name and password to local address with CouchDB port
#specifies database
#the id of the data point is added
#jq allows us to pipe the resultant JSON using the variable name _rev
#GET_REV is the result of the executed command

REV="docker exec slow_control curl -X GET http://EXO:x3n0ntpc@127.0.0.1:5984/new_data/"
REV2="${REV}${ID}"
REV3="${REV2} | jq '._rev' "
GET_REV=`$REV3`


#docker executes curl command for container slow_control
#curl command sends http request with admin name and password to local address with CouchDB port
#specifies database
#the id of the data point
#the rev number is specified so the document can be precisely identified with no conflicts

COMMAND="docker exec slow_control curl -X DELETE http://EXO:x3n0ntpc@127.0.0.1:5984/new_data/"
COMMAND2="${COMMAND}${ID}"
COMMAND3="${COMMAND2}\?rev\="
COMMAND4="${COMMAND3}${GET_REV}"

#The command is executed

RESPONSE=`$COMMAND4`

#The command is printed for debugging

echo RESPONSE

exit 0