#!/bin/bash

echo "Iniciando montagem do ambiente"

$PWD = `pwd`

sudo apt update -y

sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget

wget https://www.python.org/ftp/python/3.7.13/Python-3.7.13.tgz

tar -xf Python-3.7.13.tgz

cd python-3.7.13

./configure --enable-optimizations

sudo make altinstall

sudo make install

git clone git@github.com:cortex-intelligence/data-gathering-dag.git ../data-gathering-dag

cd ../data-gathering-dag

python3.7 -m venv venv

source venv/bin/activate

pip install --upgrade pip

pip install -r requirements-local.txt

chown -R $USER $PWD/*

rm -rf ../python-3.7.13

echo "Finalizando montagem do ambiente"
