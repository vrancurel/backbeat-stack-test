FROM node:6
MAINTAINER Vianney Rancurel <vr@scality.com>

RUN apt-get update \
    && apt-get install -y jq python git build-essential supervisor --no-install-recommends \
    && mkdir -p /var/log/supervisor \
    && npm install --production
#    && apt-get autoremove --purge -y python git build-essential \
#    && rm -rf /var/lib/apt/lists/* \
#    && npm cache clear \
#    && rm -rf ~/.node-gyp \
#    && rm -rf /tmp/npm-*

WORKDIR /usr/src/app
RUN git clone https://github.com/scality/backbeat
WORKDIR /usr/src/app/backbeat
RUN npm install

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#no ports exposed

CMD supervisord -c /etc/supervisor/supervisord.conf -n
