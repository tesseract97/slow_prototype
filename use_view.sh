#!/bin/bash


#first parameter takes the name of the design doc
design_doc=$1

#second parameter takes the name of the view function
view_name=$2


#docker exec is a docker command that specifies that curl acts on the container named "slow_control"
#curl sends an http request with admin name "EXO" and password "x3n0ntpc"
#the address 127.0.0.1 specifies it's the local machine
#5984 specifies the port, this is the connection to CouchDB
#new_data is the name of the specific database
#_design is the same for every design document
COMMAND="docker exec slow_control curl http://EXO:x3n0ntpc@127.0.0.1:5984/new_data/_design/"
#Command2 adds in the name of the design doc
COMMAND2="${COMMAND}${design_doc}"
#Command3 adds _view which lets the system know that it's requesting a view
COMMAND3="${COMMAND2}/_view/"
#Command4 specifies the view
COMMAND4="${COMMAND3}${view_name}"


#Response executes the command
RESPONSE=`$COMMAND4`

#the command is printed for clarity
echo $RESPONSE

#exit statement for debugging
exit 0