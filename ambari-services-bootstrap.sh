#!/bin/sh -
set -o errexit
set -o nounset
set -o pipefail

# This script provides an easy install of Ambari
# for RedHat Enterpise Linux 6 & CentOS 6
#
# source at http://github.com/seanorama/ambari-bootstrap
#
# Download and run as root or with sudo. Or alternatively:
#   curl -sSL https://raw.githubusercontent.com/seanorama/ambari-bootstrap/master/ambari-bootstrap.sh | sudo -E sh
#
# defaults can be overriden by setting variables in the environment:
#   For example:
#       export java_provider=oracle
#       export install_ambari_server=true
#       sh ambari-bootstrap.sh

yum install -y git

#VERSION=`hdp-select status hadoop-client | sed 's/hadoop-client - \([0-9]\.[0-9]\).*/\1/'`
VERSION=2.3

git clone https://github.com/hortonworks-gallery/ambari-zeppelin-service.git   /var/lib/ambari-server/resources/stacks/HDP/$VERSION/services/ZEPPELIN
git clone https://github.com/randerzander/jupyter-service.git   /var/lib/ambari-server/resources/stacks/HDP/$VERSION/services/jupyter-service
git clone https://github.com/simonellistonball/ambari-freeipa-service.git   /var/lib/ambari-server/resources/stacks/HDP/$VERSION/services/ambari-freeipa-service
git clone https://github.com/simonellistonball/ambari-freeipa-client.git   /var/lib/ambari-server/resources/stacks/HDP/$VERSION/services/ambari-freeipa-client

ambari-server restart
