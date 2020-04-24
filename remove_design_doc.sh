#!/bin/bash


#first input
design_doc=$1


#get _rev number
#docker executes curl command for container slow_control
#curl command sends http request with admin name and password to local address with CouchDB port
#specifies database
#_design tells that it's a design document
#the name of the design doc is added
#jq allows us to pipe the resultant JSON using the variable name _rev
#GET_REV is the result of the executed command

REV="docker exec slow_control curl -X GET http://EXO:x3n0ntpc@127.0.0.1:5984/new_data/_design"
REV2="${REV}${design_doc}"
REV3="${REV2} | jq '._rev' "
GET_REV=`$REV3`


#docker executes curl command for container slow_control
#curl command sends http request with admin name and password to local address with CouchDB port
#specifies database
#_design tells that it's a design document
#the name of the design doc is added
#the rev number is specified so the document can be precisely identified with no conflicts

COMMAND="docker exec slow_control curl -X DELETE http://EXO:x3n0ntpc@127.0.0.1:5984/new_data/_design/"
COMMAND2="${COMMAND}${design_doc}"
COMMAND3="${COMMAND2}\?rev\="
COMMAND4="${COMMAND3}${GET_REV}"

#The command is executed

RESPONSE=`$COMMAND4`

#The command is printed for debugging

echo RESPONSE

exit 0
