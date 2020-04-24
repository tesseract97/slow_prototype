# slow_control
Bash scripts to automate a CouchDB slow control database and interface with the lab's DiskStation GUI.

**Finding and Using the CouchDB Container**

The CouchDB container that holds all the databases can be found on the DiskStation. If the account accessing the DiskStation belongs to the local administrators' group (ex. EXO) the CouchDB container can be found by selecting "slow_control" from the desktop of the DiskStation looking like the following.

![slow_control_container](https://user-images.githubusercontent.com/47134315/80164784-f1bdc580-85a7-11ea-8d64-59f9ff4e444b.png)

If the icon can't be found there, the alternative path (still only available if the account accessing the DiskStation belongs to the local administrators' group) is clicking on the Package Center, then click on installed packages, then open Docker. Under "containers," the "slow_control" container can be accessed by selecting the container and then click details to get to features like port settings for sending requests to databases, path settings to link the container to the File Station of the DiskStation, log for error message, and terminal for the backend of the container. 

![slow_control Details Page](https://user-images.githubusercontent.com/47134315/80165119-bb347a80-85a8-11ea-9b5a-3424df2a8b21.png)

The CouchDB container holds databases, each database corresponding to a data channel. Each document is a data point collected at a specific instance. Initially, the database is configured so that the \_id for each document is the JSON timestamp of the data point and the other fields are temperature and pressure. 

**Script Locations** 

All scripts are located in the File Station of the lab's DiskStation within BvL_Storage/Bvlabs/Users/tessac/scripts.

The scripts are run through the Control Panel of the lab's DiskStation, specifically the Task Scheduler. Each one is labeled and can be run by selecting the labeled task and clicking the "Run" button.

![hello_world_script_example](https://user-images.githubusercontent.com/47134315/80162195-9e944480-85a0-11ea-8bd3-636a87e673ad.png)

The output of the scripts are located in the File Station of the lab's DiskStation within BvL_Storage/Bvlabs/Users/tessac/script_output.

**Script Specifics**

Scripts Include:

- get_databases.sh
(returns all databases within the container)

- get_database.sh
(takes the database name and returns database information)

- create_database.sh
(takes a database name and creates a database within the container)

- remove_database.sh
(takes a database name and removes that database within the container)

- insert_data.sh
(takes timestamp, temperature, and pressure and inserts into the database in use)

- remove_data.sh
(takes timestamp and removes data point at that timestamp)

- create_design_doc.sh
(takes two parameters that specify the name of the design doc and a string that gives a view function to create a design doc with specified name and a view called "first_view" that's linked to the inputted function. 

- remove_design_doc.sh
(takes the \_id of the design_doc and deletes it from the database)

- get_design_doc.sh
(takes the \_id of the design doc and prints information about it)

- use_view.sh
(takes two parameters that specify the selected view and then returns data specified by the view)

**Parameter Use**

When a script takes parameters, it's indicated by "REQUIRES PARAMS" in the title of the script and the parameters can be edited by clicking "Edit" and then going to Task Settings. The parameters immediately follow the bash script which ends with .sh
The image below shows a task that runs a bash script called use_view.sh that takes two parameters. The two given in the image are "show_specs" and "first_specs"

![add_param_visual](https://user-images.githubusercontent.com/47134315/80162426-4dd11b80-85a1-11ea-9901-f07d16b5d11b.png)

**Parameter Specifics**

The scripts that take parameters include:

- get_database.sh
(takes one parameter
database_name is a string specifying the name of the database eg. "new_data"

- create_database.sh
(takes one parameter
database_name is a string specifying the name of the desired database eg. "new_data"

- remove_database.sh
(takes one parameter
database_name is a string specifying the name of the database to be removed eg. "new_data"

- insert_data.sh
(takes two parameters
temperature is a number expressed as a string eg. "43" 
pressure is a number expressed as a string eg. "33"
*In the future, there'll be another input specifying database because there will be more than one data channel*

- remove_data.sh
(takes one parameter 
timestamp is a Javascript approved timestamp expressed as a string eg. "2012-04-23T18:25:43.511Z")

- create_design_doc.sh
(takes two parameters
design_doc is a string that names the design_doc
view_function is a string that defines what fields the field will show
*For now, it just links the function to the map field but with greater development of design docs, it can be linked to other fields*

- remove_design_doc.sh
(takes one parameter
the design document name is a string that specifies the name of the design_doc and deletes it from the database)

- get_design_doc.sh
(takes one parameter
the design document name is a string that specifies the name of the design_doc and prints information about it)

- use_view.sh
(takes two parameters: 
design_name is a string specifying the design document eg. "show_specs"
view_name is a string specifying the view eg "first_specs")




