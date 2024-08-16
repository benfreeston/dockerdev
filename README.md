# Development Container

I like to play with data and ideas. I like docker for portability. I like to use notebooks, but I also like to run stuff in bash.
Sometimes I want to be able to build little web servers. I use dash.

## Setup

The project is containerized using Docker. To run the project, you need to have Docker installed on your machine.

Edit config.sh and change IMAGE_NAME to the name of your project. This will be both the name of the container
and the python project within the container. You can change the folder 'my_project' to match this, or this 
will be done dynamically as part of the build on each run.

The easiest way to run the container is to use the bundled `start.sh` script. 

First set permissions to make this executable:

```
chmod +x start.sh 
```

# Jupyter usage

```
./start.sh jupyter
```

This will also start the jupyter server and print the URL of that server. Enter that into VSCODE as a the jupyter remote if that's
what you want to do.

# Bash usage

```
./start.sh bash
```

This will run the Docker container and mount the `app` directory to the container. This means that vscode can be 
used to edit the code and the changes will be reflected in the container. It also means the data doesn't need 
to be copied to the container on build.

This will also mount the local .aws folder. This requires that the AWS CLI has been installed and credentials created
and makes these available within the container.

The code is packaged and the easiest way to develop and run is in interactive install mode. In bash mode in the container run:

Code can then be run from the command line. For example:

```
python -m *your_image_name*.test
```

# Dash usage

```
./start.sh dash
```

This will run the Dash server and print the URL of that server. Enter that into a browser to see the dash app.