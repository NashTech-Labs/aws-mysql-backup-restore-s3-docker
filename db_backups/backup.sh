#! /bin/bash

set -e     # exit if a command fails
set -o pipefail  # set exit code of pipeline to that rightmost command with a non zero exit code, or to zero on success

if [ "${MYSQL_DATABASE}" = "" ]; then
  echo "You need to set the MYSQL_DATABASE environment variable."
  exit 1
fi

if [ "${MYSQL_HOST}" = "" ]; then
  echo "You need to set the MYSQL_HOST environment variable."
  exit 1
fi

if [ "${MYSQL_PORT}" = "" ]; then
  echo "You need to set the MYSQL_PORT environment variable."
  exit 1
fi

if [ "${MYSQL_USER}" = "" ]; then
  echo "You need to set the MYSQL_USER environment variable."
  exit 1
fi

if [ "${MYSQL_PASSWORD}" = "" ]; then
  echo "You need to set the MYSQL_PASSWORD environment variable or link to a container named MYSQL."
  exit 1
fi

if [ "${S3_ENDPOINT}" = "" ]; then
  echo "You need to set the MYSQL_PASSWORD environment variable or link to a container named MYSQL."
  exit 1
fi

# env vars needed for aws tools
if [ "$S3_ACCESS_KEY_ID" != "iam" ]; then
  export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID
fi

if [ "$S3_SECRET_ACCESS_KEY" != "iam" ]; then
  export AWS_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY
fi

export AWS_DEFAULT_REGION=$S3_REGION

NOW=$(date "+%Y%m%d%H%M")

mysqldump --host=${MYSQL_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} -R -E  > $NOW.sql

aws s3 cp $NOW.sql s3://${S3_BUCKET}/${S3_PATH}/

echo "Backup Completed"
