#!/usr/bin/env bash -euo pipefail

JENKINS_HOME=/opt/jenkins
USAGE="Usage: $0 \${access_key} \${secret_key} \${aws_bucket} \${jenkins_name}"

access_key=${1?"Missing: access_key - $USAGE"}
secret_key=${2?"Missing: secret_key - $USAGE"}
aws_bucket=${3?"Missing: aws_bucket - $USAGE"}
jkins_name=${4?"Missing: jenkins_name - $USAGE"}



(
  crontab -l 2>/dev/null \
  echo "* * * * *      /usr/bin/docker run --env aws_key=${access_key} --env aws_secret=${secret_key} --env cmd=sync-local-to-s3 --env DEST_S3=s3://${aws_bucket}/${jkins_name}/jenkins/  -v $JENKINS_HOME:/opt/src/$(/bin/date +\%Y\%m\%d) garland/docker-s3cmd"
) | crontab -
