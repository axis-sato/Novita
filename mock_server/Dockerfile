FROM node:boron

LABEL maintainer="c8112002"

RUN npm install -g json-server

WORKDIR /data

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
