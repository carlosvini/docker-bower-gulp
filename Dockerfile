# This image will be based on the official nodejs docker image
FROM node:latest

# Add all our code inside that directory that lives in the container
ADD . /var/www/

# Commands will run in this directory
WORKDIR /var/www

# Cache npm package
RUN curl --remote-name http://static.dev.jp7.com.br/npm_cache.tar \
  && tar -xvf npm_cache.tar \
  && npm rebuild node-sass
 
# Install dependencies and generate production dist
RUN npm install --production
