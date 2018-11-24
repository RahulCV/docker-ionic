FROM rahulcv/cordova

LABEL maintainer="rahulcv@hotmail.co.in" 

ENV IONIC_VERSION 3.9.2

RUN apt-get update && apt-get install -y git bzip2 openssh-client && \
    npm i -g --unsafe-perm ionic@${IONIC_VERSION} && \
    ionic --no-interactive config set -g daemon.updates false && \
    rm -rf /var/lib/apt/lists/* && apt-get clean 
RUN npm install -g yarn
RUN npm install -g gulp
