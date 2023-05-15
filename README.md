# OpenStack Stein with Swift

<p align="center">
     <img src=https://github.com/lucadagati/openstack_stein_swift/blob/main/OpenStack-Logo-Horizontal.png>
</p>


This bash script installs the Stein version of OpenStack with keystone, glance, placement, nova, neutron, horizon, and Swift (with integrated virtualized drive) services. The script is an Ubuntu shell script and should be executed on an Ubuntu 18.04 LTS system.

## Prerequisites

- Ubuntu 18.04 LTS system
- Internet connection
- Git installed
- sudo

## Installation

To use the script, download and execute the source code by running the following commands:

```bash
git clone https://github.com/lucadagati/openstack_stein_swift.git
cd openstack_stein_swift
# /path/to/hdd change the path with the drive path you want to use for swift (drive must be unmounted)
# if to specified it will create a virtual hard drive
sudo ./Stein_Installation.sh /path/to/hdd

#note:
#during the installation the script will ask:
# *** 50-server.cnf (Y/I/N/O/D/Z) [default=N] ?
# answer: N

```

## Configuration

The "conf" directory contains preconfigured config files for the services. Any changes to the variables in the script should be reflected in these files. The "admin-openrc" and "demo-openrc" files contain preconfigured credentials and should be updated if necessary.

## Note
Please be aware that the script have been tested on an specific environment and that it is not guaranteed to work in all environments.
