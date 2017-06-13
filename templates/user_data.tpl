#!/usr/bin/env bash -euo pipefail

JENKINS_HOME=/opt/jenkins

# Create and set correct permissions for Jenkins mount directory
sudo mkdir -p      $JENKINS_HOME && \
sudo chmod -R 0777 $JENKINS_HOME

# Start Jenkins
docker run                          \
  -id --name jenkins                \
  -p 80:8080                        \
  -p 50000:50000                    \
  -v $JENKINS_HOME:/var/jenkins     \
jenkins:2.3-alpine
