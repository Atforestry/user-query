FROM node:lts-alpine

WORKDIR /usr/src/app

RUN npm i @vue/cli-service

COPY ./app/package.json .
RUN npm install

COPY ./app/vue.config.js .
COPY ./app/jsconfig.json .
COPY ./app/babel.config.js .
COPY ./app/yarn.lock .
COPY ./app/src ./src
COPY ./.env .

EXPOSE 8000

CMD ["yarn", "serve", "--port", "8000"]
