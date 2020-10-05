FROM node:14.11.0-alpine

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:jp
ENV LC_ALL ja_JP.UTF-8

RUN apk update \
    && apk upgrade \
    && apk --no-cache add --virtual .build-deps \
    tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && echo Asia/Tokyo > /etc/timezone \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

WORKDIR /code

RUN npm install -g parcel
RUN npm install -g http-server

COPY package.json .
COPY .sassrc .

RUN npm install

COPY src ./src

CMD ["npm", "run", "start"]
