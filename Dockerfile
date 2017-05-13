FROM mhart/alpine-node:7.8

ARG NPM_TOKEN

EXPOSE 80

ENV NPM_CONFIG_LOGLEVEL=warn

RUN mkdir /code

COPY package.json .npmrc /code/

WORKDIR /code

RUN npm install --depth=0 --production

RUN rm -f .npmrc

COPY . /code

CMD ["npm", "start"]
