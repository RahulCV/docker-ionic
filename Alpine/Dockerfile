FROM adoptopenjdk/openjdk8:alpine
LABEL maintainer="rahul CV <rahulcv@hotmail.co.in>"

ENV SDK_TOOLS "6514223"
ENV ANDROID_HOME "/opt/sdk"

ENV BUILD_TOOLS "29.0.3"
ENV TARGET_SDK "29"
ENV PATH $PATH:${ANDROID_HOME}/cmdline-tools/tools/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/${BUILD_TOOLS}
ENV CORDOVA_VERSION 9.0.0
ENV IONIC_VERSION 3.20.1

# Install required dependencies
RUN apk add --no-cache bash git unzip wget && \
    apk add --virtual .rundeps $runDeps && \
    apk --no-cache add curl && \
    apk add --no-cache su-exec && \
    set -ex && apk --no-cache add sudo && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*
# Download and extract Android Tools
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-${SDK_TOOLS}_latest.zip -O /tmp/tools.zip && \
    mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    unzip -qq /tmp/tools.zip -d ${ANDROID_HOME}/cmdline-tools && \
    rm -v /tmp/tools.zip

# Install SDK Packages
RUN mkdir -p ~/.android/ && touch ~/.android/repositories.cfg && \
    yes | sdkmanager --sdk_root=${ANDROID_HOME} --licenses && \
    sdkmanager --sdk_root=${ANDROID_HOME} "platform-tools" "extras;android;m2repository" "extras;google;m2repository" "extras;google;instantapps" && \    
    sdkmanager "build-tools;${BUILD_TOOLS}" "platforms;android-${TARGET_SDK}" && \ 
    sdkmanager --update 
RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ nodejs=8.14.0-r0   && \ 
    apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ npm=8.14.0-r0   && \
    apk add gradle && \
    apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/    python3=3.6.9-r1  && \ 
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* 
RUN node --version && \
    npm i -g --unsafe-perm cordova@${CORDOVA_VERSION} && \
    npm i -g --unsafe-perm ionic@${IONIC_VERSION} && \
    ionic --no-interactive config set -g daemon.updates false && \
    npm i -g gulp@3  

WORKDIR /home/android
