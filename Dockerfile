FROM node:lts

COPY . /usr/local/app

WORKDIR /usr/local/app

RUN yarn install

CMD ["npx", "http-server", "-c-1"]
