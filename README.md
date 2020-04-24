# slow_control
Bash scripts to automate a CouchDB slow control database and interface with DiskStation GUI

All scripts are located in the File Station of the lab's DiskStation within BvL_Storage/Bvlabs/Users/tessac/scripts.

The scripts are run through the Control Panel of the lab's DiskStation, specifically the Task Scheduler. Each one is labeled and can be run by selecting the labeled task and clicking the "Run" button.

![hello_world_script_example](https://user-images.githubusercontent.com/47134315/80162195-9e944480-85a0-11ea-8bd3-636a87e673ad.png)

The output of the scripts are located in the File Station of the lab's DiskStation within BvL_Storage/Bvlabs/Users/tessac/script_output.

Scripts Include:

- get_databases.sh
(returns all databases within the container)

- use_view.sh
(takes two parameters that specify the selected view and then returns database specified by the view)


When a script takes parameters, it's indicated by "REQUIRES PARAMS" in the title of the script and the parameters can be edited by clicking "Edit" and then going to Task Settings. The parameters immediately follow the bash script which ends with .sh
The image below shows a task that runs a bash script called use_view.sh that takes two parameters. The two given in the image are "show_specs" and "first_specs"

![add_param_visual](https://user-images.githubusercontent.com/47134315/80162426-4dd11b80-85a1-11ea-9901-f07d16b5d11b.png)


The scripts that take parameters include:


- use_view.sh
(takes two parameters: 
design_name is a string specifying the design document eg. "show_specs"
view_name is a string specifying the view eg "first_specs")

