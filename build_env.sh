VENV_NAME=.venv
poetry install --no-root
poetry export --without-hashes -f requirements.txt --output requirements.txt
poetry run python -m ipykernel install --user --name $VENV_NAME --display-name "Py3 BoMwater"
poetry run jupyter lab