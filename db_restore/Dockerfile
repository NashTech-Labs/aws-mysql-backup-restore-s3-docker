FROM alpine:3.9

RUN apk update && \
    apk add --no-cache mysql-client python py2-pip coreutils bash && \
    pip install awscli && \
    apk del py2-pip

ENV MYSQL_DATABASE=MYSQL
ENV MYSQL_HOST=MYSQL
ENV MYSQL_PORT=3306
ENV MYSQL_USER=MYSQL
ENV MYSQL_PASSWORD=MYSQL
ENV S3_ACCESS_KEY_ID=123
ENV S3_SECRET_ACCESS_KEY=xyz
ENV S3_BUCKET=my-bucket
ENV S3_REGION=us-east-1
ENV S3_PATH="backup"
ENV S3_ENDPOINT=http://localhost:4572


ADD docker_restore.sh docker_restore.sh
CMD ["bash", "docker_restore.sh"]
