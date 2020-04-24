#!/bin/bash

#first parameter takes the name of the design doc
design_doc=$1

#second parameter takes the view function
#Example view function: "function(doc){emit(doc.temperature, doc.pressure)}"
view_function=$2


#add view function to the map function of a view called my_view
#Because so many strings are added, escape chars must be added "\"
#the _id of the document is "_design/" + the first parameter
#in the future, with more wider ranging views, the map function can be swapped for a different command
#aux adds some closing brackets and a single quote to close the command cleanly
#the double quotes are necessary because the variables are being evaluated

VIEW_FUNC="docker exec slow_control curl -H \“Content-Type: application/json\” -X PUT http://EXO:xen0ntpc@127.0.0.1:5984/new_data/_design/show_specs -d ‘{“_id”: \“_design/"
VIEW_FUNC2="${VIEW_FUNC}${design_doc}\""
VIEW_FUNC3="${VIEW_FUNC2}, \"views\”: {\“my_view\”: {\“map\”:"
VIEW_FUNC4="${VIEW_FUNC3}${view_function}"
AUX="}}}'"
VIEW_FUNC5="${VIEW_FUNC4}${AUX}"
RESPONSE=`$VIEW_FUNC5`

#print statements clarify the design doc
echo "A design doc has been created that is named: "
echo $design_doc


#exit statement for debugging
exit 0