#!/bin/bash

set -Eeuxo pipefail

yum update -y

amazon-linux-extras install -y epel

# miscellaneous dependencies for R and common packages
yum install -y gcc gcc-gfortran gcc-c++ java-devel libcurl-devel readline-devel pcre-devel \
  bzip2-devel libxml2-devel openssl-devel openblas-devel postgresql-devel zeromq-devel git

# R
cd /tmp
curl -O https://cran.r-project.org/src/base/R-3/R-3.6.3.tar.gz
tar xvf R-3.6.3.tar.gz
cd R-3.6.3
./configure --with-x=no --enable-R-shlib --with-blas="-lopenblas" --without-recommended-packages
make -j 2
make install

# R defaults
echo 'options(repos = c(CRAN="https://cran.r-project.org/"))' >> /usr/local/lib64/R/etc/Rprofile.site
/usr/local/bin/R CMD javareconf
