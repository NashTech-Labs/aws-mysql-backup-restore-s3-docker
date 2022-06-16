### Backup of Mysql database and pushing it to the s3 bucket:
cd db_backup
Update all the environment variables in the docker-compose file
docker-compose up -d

### Restoring Mysql database from the s3 bucket:
cd db_restore
Update all the environment variables in the docker-compose file
docker-compose up -d

### Environments:

| Environment Variable     | Description      | 
| ------------- | ------------- | 
| MYSQL_DATABASE          | database name fot backup         |
| MYSQL_HOST           | mysql host ip/hostname         |
| MYSQL_PORT          | mysql port         |
| MYSQL_USER           | mysql user         |
| MYSQL_PASSWORD          | mysql password         |
| S3_ACCESS_KEY_ID           | access key         |
| S3_SECRET_ACCESS_KEY          | secret access key         |
| S3_BUCKET           | s3 bucket|
| S3_REGION          | s3 bucket region         |
| S3_PATH           | s3 prefix/directory         |
| SQL_FILE          | sql file which u want to restore         |


