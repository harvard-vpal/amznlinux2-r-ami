# R AMI

This Packer template builds an Amazon Machine Image based on a specified Amazon Linux 2 AMI and includes the following dependencies for R and some commonly-installed packages:

* C and C++ compilers
* Java
* curl
* readline
* OpenBLAS
* PostgreSQL
* zeroMQ
* git

R 3.6.3 is compiled with OpenBLAS.

To build:

```sh
packer build \
    -var 'subnet_id=subnet-abcd0123' \
    -var 'ssh_keypair_name=foo' \
    -var 'ssh_private_key_file=~/.ssh/foo.pem' \
    -var 'instance_type=t2.small' \
    -var 'source_ami=ami-ffff0000ffff0000' \
    rstudio-server-ami.json
```
