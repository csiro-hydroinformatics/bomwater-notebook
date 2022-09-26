VENV_NAME=.venv
poetry install --no-root
poetry shell
poetry run python -m ipykernel install --user --name $VENV_NAME --display-name "Py3 BoMwater"
jupyter lab