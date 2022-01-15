git init

python -m venv venv

touch main.py readme.md

echo venv/ > ./.gitignore

echo pwd

$PWD = `pwd`

source $PWD/venv/bin/activate

pip install --upgrade pip

# chown -R $USER .git .gitignore main.py readme.md venv

chown -R $USER $PWD
