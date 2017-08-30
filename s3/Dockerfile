FROM node:6
MAINTAINER Vianney Rancurel <vr@scality.com>

WORKDIR /usr/src/app

# Keep the .git directory in order to properly report version
COPY . /usr/src/app

RUN apt-get update \
    && apt-get install -y jq python git build-essential supervisor --no-install-recommends \
    && mkdir -p /var/log/supervisor

WORKDIR /usr/src/app
RUN git clone https://github.com/scality/S3
WORKDIR /usr/src/app/S3
RUN npm install

COPY config.json /usr/src/app
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/usr/src/app/localData","/usr/src/app/localMetadata"]

EXPOSE 8000

CMD supervisord -c /etc/supervisor/supervisord.conf -n
