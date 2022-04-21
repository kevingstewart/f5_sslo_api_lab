#!/bin/bash

# Create folders and files
mkdir -p ansible && cd ansible
mkdir -p inventory/{group_vars,host_vars}
mkdir -p {library/modules,playbooks,files,roles,scripts,templates}
touch {inventory/group_vars/all.yaml,inventory/host_vars/host.yaml,playbooks/site.yaml}

# Create ansible.cfg
if [ ! -f $(pwd)/ansible.cfg ]
then
   echo $'[defaults]\nhost_key_checking	= False\nretry_files_enabled = False\ninventory           = ./inventory/hosts\nlibrary             = ./library\nroles_path          = ./roles\ncollections_paths   = ./collection\n' > $(pwd)/ansible.cfg
fi

# Create inventory/hosts
if [ ! -f $(pwd)/inventory/hosts ]
then
   echo $'[all]\nlocalhost' > $(pwd)/inventory/hosts
fi

# Install F5 Ansible collection
ansible-galaxy collection install f5networks.f5_bigip
