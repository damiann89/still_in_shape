# Small openstack test

## Creating openstack environment
To create an openstack environment I've used devstack instructions from https://docs.openstack.org/devstack/latest/.
For that purpose I've created kvm vm based on latest ubuntu 22.04 LTS server image called openstack1 with the following specs:
- 3 CPU
- 4096MB RAM
- 50GB disk (lvm in case I needed to extend it quickly)

#### Note: I've created entry in local /etc/hosts for openstack1.

In `local.conf` file I modified default values for two variables:
- LOGDAYS - set to 10 in case I needed to present the logs.
- SWIFT_REPLICAS - set to 1(default was 3) to save resources.


After `stack.sh` script finished configuring all required services I've done the following.

- downloaded openrc file for admin user in admin project.
- created openssh key in the UI and downloaded pem file to my .ssh directory.

### Little gotchas 
- Had to deploy devstack twice because first VM didn't have enough resources to contain all services.
- Ubuntu VM needed to run updates firs, without it auto installation of the cider service was crashing the machine. Update fixed the problem, didn't had time to investigate any further.

## Terraform
This section describes openstack resources deployed by terraform.

### network.tf
It's responsible to create router called `test_router` two networks with subnets assigned and ports connected to that router.

### infra.tf
It's responsible for creating 3 virtual machines within two separate networks.

### main.tf
It's responsible for configuring 

### modules
#### instance
It's a tiny module that is responsible for creating a number of virtual machines with given parameters

### Little gotchas
- apache on opentack1 didn't listen on port 5000(keystone auth) had to set authentication url to http://openstack1/identity.

### Summary
Goal of this exercise was to create three VM's in two different networks connected together into router and prove connectivity.
Pictures describing exercise can be found inside `pictures` dictionary.

#### Possible improvements
- auto-generated floating IP's that would be connected to the instance triggered by flag
- adding ability to create custom volume with block store for flavours that doesn't specify disk sizes
- configuring ssl on apache
- using different deployment method than devstack that would allow more customization
- fixing provider inheritance for instance module
- creating an actual domain instead of using admin:)

# Finding the longest chain exercise
The following iterative sequence is defined for the set of positive integers:
n => n/2 (n is even)
n => 3n + 1 (n is odd)
Using the rule above longest chain of numbers between 1 and 99999 has 77031 with 350 chain of numbers.
Code that counts it can be found under `scripts/math.py`

# Fake grep
The goal of this exercise was to mimic part of grep functionalities.
Script under `scripts/fake_grep.py` will crawl threw provided path and find if provided pattern exists in any of the spotted files.
