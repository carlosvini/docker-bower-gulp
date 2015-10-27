# This image will be based on the official nodejs docker image
FROM node:latest

# Commands will run in this directory
WORKDIR /var/www

# Add all our code inside that directory that lives in the container
ADD . /var/www/
 
# Install dependencies and compile frontend
RUN npm install && \
./node_modules/.bin/bower install install --config.interactive=false --allow-root && \
npm rebuild node-sass && \
./node_modules/.bin/gulp
