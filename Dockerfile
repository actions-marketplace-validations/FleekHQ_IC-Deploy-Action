# FROM node:16-alpine3.11
FROM node:16

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH="/home/node/.npm-global/bin:$PATH"

USER node

COPY dfx-install.sh /home/dfx-install.sh
COPY entrypoint.sh /home/node/entrypoint.sh

USER root

# RUN apk add --update curl
RUN apt-get update

RUN apt-get install -y curl

RUN apt-get install -y libgl1-mesa-glx

RUN ["chmod", "+x", "/home/dfx-install.sh"]

RUN ["sh", "-m", "/home/dfx-install.sh"]

RUN ["chmod", "+x", "/home/node/entrypoint.sh"]

ENTRYPOINT ["/home/node/entrypoint.sh"]