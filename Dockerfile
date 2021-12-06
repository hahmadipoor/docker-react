FROM node:12.18.1 as builder

WORKDIR /usr/app

COPY ./package.json /usr/app
RUN npm install
COPY ./ /usr/app

RUN npm run build

FROM nginx
COPY --from=builder /usr/app/build /usr/app/share/nginx/html
