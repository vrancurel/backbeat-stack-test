FROM node:6
MAINTAINER Vianney Rancurel <vr@scality.com>

WORKDIR /opt/s3

# Keep the .git directory in order to properly report version
COPY . /opt/s3

RUN apt-get update \
    && apt-get install -y jq python git build-essential supervisor --no-install-recommends \
    && mkdir -p /var/log/supervisor

WORKDIR /opt/s3
RUN git clone https://github.com/scality/S3
WORKDIR /opt/s3/S3
RUN npm install

COPY config.json /opt/s3/S3
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/data","/metadata"]

EXPOSE 8000

CMD supervisord -c /etc/supervisor/supervisord.conf -n
