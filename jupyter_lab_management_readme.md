### Jupyter Lab

If not already installed you will require [Jupyter Lab](https://jupyterlab.readthedocs.io/en/stable/), 
see [conda documentation](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) for management of your environment.

#### Creating a environment.yml file
Why python enviornments are used [see doco here](https://docs.python.org/3/tutorial/venv.html)

A `.yml` file is used to list packages required by your application/project and is used to create the python environment.

The following is an example of a `.yml` which lists typical packages (some have versions applied eg `python=3.6`).  You are also able to install using `pip` if a package is not avialable via the conda package repository

```
name: [Your Environment Name Here]
channels:
  - defaults
  - conda-forge 
dependencies: 
  - python=3.6
  - pandas=0.19.2
  - geopandas
  - requests
  - numpy
  - matplotlib
  - voila
  - jupyterlab 
  - ipywidgets 
  - jupyter
  - pint
  - autopep8
  - geojson
  - fiona
  - shapely
  - ipyleaflet
  - sidecar
  - pip
  - pip:
    - json
```

### Setup

Prerequisites: your computer has `conda` installed and available from a command prompt (check with `where conda` on windows and `which conda` on Linux).

The following commands create an environment with a name that is listed in the `environment.yml` file.

```bat
cd c:\path\to\here [where the environment.yml is stored]
conda env create -f=./environment.yml
```
> #### Alternatively
>> If you want another name you can override the default name:

>>```
>>set my_env_name=something_else 
>>conda env create -f=./environment.yml --name %my_env_name% 
>>```

Activate the newly created environment, register it as a so-called `kernel`. There is a bit of legwork also to install `jupyter-widgets`.

```bat
set my_env_name=[Your name in the environment file]
conda activate %my_env_name%
jupyter-labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install @jupyter-widgets/jupyterlab-sidecar
python -m ipykernel install --user --name %my_env_name% --display-name "Py3 BoM Water"
```

In the above steps you may get an error that node.js was not installed (or labextensions has an issue, reinstall nodejs to fix). Steps to install node.js are here https://anaconda.org/conda-forge/nodejs

If you need to customise your environment or more information see [this conda documentation](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)

### Updating the environment
If one of the packages has changed you can executed the following
```bat
cd c:\path\to\here [where the environment.yml is stored]
set my_env_name=[Your name in the environment file]
conda activate %my_env_name%
conda env update --prefix ./env --file environment.yml  --prune
```

### Getting started 

The above steps only need to be followed initially or if the packages are updated. Once the conda env is active you can start jupyter lab with the following command 

Using pyBRAT in Jupyter Lab:
then to start jupyter run

```sh
jupyter lab
```

> #### Alternatively
>> You can create a `.bat` file to activate your envirnment and start Jupyter Lab

>>```
>>set mypath=%cd%
>>@echo %mypath%
>>cd %mypath%
>>CALL activate [Your env name]
>>jupyter lab
>>```

If you have created widgets you can use Voila, which will start the notebook in a Voila server

```sh
voila ./notebooks/[Notebook name].ipynb
```