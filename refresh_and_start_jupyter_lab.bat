set mypath=%cd%
@echo %mypath%
cd %mypath%

CALL conda deactivate

CALL conda env remove --name bomwater_nb_env

CALL conda env create -f=./environment.yml

CALL activate bomwater_nb_env

CALL jupyter-labextension install @jupyter-widgets/jupyterlab-manager
CALL jupyter labextension install @jupyter-widgets/jupyterlab-sidecar
CALL python -m ipykernel install --user --name bomwater_nb_env --display-name "Py3 bomwater"
CALL activate bomwater_nb_env

jupyter lab