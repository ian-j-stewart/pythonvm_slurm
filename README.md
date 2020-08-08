This repository is an example of how to run python scripts in a python virtual environment on slurm. The advantage of this approach is that you can create a project-specific environment in which to install python packages. The code involves 1) creating the virtual environment. 2) a requiremets.txt file in which you list python packages to be installed plus your python script (in this case called test.py) and 3) a slerm batch submitter which passes in the virtualenvironment path, the requirements.txt file and your python script. 

To use this script do the following. 

First, clone this repository. Then execute the commands below. 


#install  the virtualenvpackage  to your home directory 

pip3 install -t $HOME virtualenv

#allow python to see the package by adding it to your pay

export PYTHONPATH=$PYTHONPATH:$HOME/.virtualenvs/AdS


#Note: if you want to test the environment before submission to Slurm you can: 
#Enter the virtual environment 
source $HOME/.virtualenvs/AdS/bin/activate
#you are now working in the virtual environment so could install project packages just with pip install (i.e. pip install pandas) 
#to exit the env 
deactivate


Next, you can run your python script on slurm in the virtualenv with the following command. Note that the configuration for this is in the slurm-python.sh file which you can customise. Right now all the code does is install packages from the requirements.txt, list installed packages, and print a line of code. 

sbatch slurm_python.sh

