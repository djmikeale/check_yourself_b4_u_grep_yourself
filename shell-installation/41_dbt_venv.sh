#! /bin/bash

echo "creating virtual environment at pwd"
python3 -m venv ~/venv
echo "activating venv"
source ~/venv/bin/activate
echo "installing dbt"
pip3 install dbt-duckdb
echo "checking packages have been installed"
pip3 freeze
echo 'adding alias: alias activ8="source ~/venv/bin/activate" to ~/.zshrc'
echo 'alias activ8="source ~/venv/bin/activate"' >> ~/.zshrc