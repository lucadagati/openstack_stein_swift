# OpenStack Stein with Swift

This bash script installs the Stein version of OpenStack with keystone, glance, placement, nova, neutron, horizon, and Swift (with integrated virtualized drive) services. The script is an Ubuntu shell script and should be executed on an Ubuntu 18.04 LTS system.

## Prerequisites

- Ubuntu 18.04 LTS system
- Internet connection
- Git installed

## Installation

To use the script, download and execute the source code by running the following commands:

git clone https://github.com/lucadagati/openstack_stein_swift.git
cd openstack_stein_swift
bash Stein_Installation.sh


## Configuration

The "conf" directory contains preconfigured config files for the services. Any changes to the variables in the script should be reflected in these files. The "admin-openrc" and "demo-openrc" files contain preconfigured credentials and should be updated if necessary.

## Note
Please be aware that the script have been tested on an specific environment and that it is not guaranteed to work in all environments.
