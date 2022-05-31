FROM node:lts-alpine

WORKDIR /usr/src/app

RUN npm i @vue/cli-service

COPY ./app/package.json .
COPY ./app/vue.config.js .
COPY ./app/jsconfig.json .
COPY ./app/babel.config.js .
COPY ./app/yarn.lock .
COPY ./app/src ./src
COPY ./.env .
RUN npm install

EXPOSE 8080

CMD ["yarn", "serve"]
