FROM mhart/alpine-node:7.8
# FROM garagegigs/alpine-node:7.8
EXPOSE 80
ENV NPM_CONFIG_LOGLEVEL=warn

# RUN npm install --global yarn

RUN mkdir /code
COPY package.json /code/
WORKDIR /code
RUN npm install --depth=0 --production
# RUN yarn install
COPY . /code

CMD ["npm", "start"]
