FROM mhart/alpine-node:7.10

# ARG NPM_TOKEN=to-be-implemented

EXPOSE 80

ENV NPM_CONFIG_LOGLEVEL=warn

RUN mkdir /code

# COPY package.json .npmrc /code/
COPY package.json /code/

WORKDIR /code

RUN npm install --depth=0 --production

RUN rm -f .npmrc

COPY . /code

CMD ["npm", "start"]
