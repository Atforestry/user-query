# server environment
FROM nginx:alpine

ARG VUE_APP_API_URL=localhost:8030
ARG VUE_APP_GOOGLE_MAPS_KEY=AIzaSyC_8Itm1gZjpl7-6guyIomDCuIqptqY4M4

ENV VUE_APP_API_URL $VUE_APP_API_URL
ENV VUE_APP_GOOGLE_MAPS_KEY $VUE_APP_GOOGLE_MAPS_KEY

WORKDIR /app
COPY app/ ./

RUN apk add nodejs npm
RUN npm install -g yarn
RUN yarn
RUN yarn build

COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN cp -R /app/dist /usr/share/nginx/html
COPY start.sh ./

EXPOSE 8000
CMD ["/app/start.sh"]

