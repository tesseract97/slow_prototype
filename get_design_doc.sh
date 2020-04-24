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


#get views
#docker executes curl command for container slow_control
#curl command sends http request with admin name and password to local address with CouchDB port
#specifies database
#_design tells that it's a design document
#the name of the design doc is added
#jq allows us to pipe the resultant JSON using the variable name views
#GET_VIEWS is the result of the executed command

VIEW="docker exec slow_control curl -X GET http://EXO:x3n0ntpc@127.0.0.1:5984/new_data/_design"
VIEW2="${VIEW}${design_doc}"
VIEW3="${VIEW2} | jq '.views' "
GET_VIEWS=`$VIEW3`

#print statements that give specifics
echo "REV number is: "
echo $GET_REV
echo " and view functions are: "
echo $GET_VIEWS

exit 0