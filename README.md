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

- use_view.sh
(takes two parameters that specify the selected view and then returns database specified by the view)

**Parameter Use**

When a script takes parameters, it's indicated by "REQUIRES PARAMS" in the title of the script and the parameters can be edited by clicking "Edit" and then going to Task Settings. The parameters immediately follow the bash script which ends with .sh
The image below shows a task that runs a bash script called use_view.sh that takes two parameters. The two given in the image are "show_specs" and "first_specs"

![add_param_visual](https://user-images.githubusercontent.com/47134315/80162426-4dd11b80-85a1-11ea-9901-f07d16b5d11b.png)

**Parameter Specifics**

The scripts that take parameters include:


- use_view.sh
(takes two parameters: 
design_name is a string specifying the design document eg. "show_specs"
view_name is a string specifying the view eg "first_specs")




