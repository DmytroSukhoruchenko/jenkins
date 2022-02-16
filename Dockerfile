# The first instruction is what image we want to base our container on
# We Use an official Node version 10 image as a parent image
FROM node:10

# Create app directory for Real World React example app
# NOTE: all the directives that follow in the Dockerfile will be executed in
# that directory.
WORKDIR /usr/src/app

# Copy the package.json file into our app directory
COPY . /usr/src/app/

# Install any needed packages specified in package.json
RUN npm install

RUN ls /usr/src/app
RUN ls /usr/src/app/public

EXPOSE 80
ENV REACT_APP_BACKEND_URL=http://localhost:3000/api
#ENV secret_key_base: b4ec4bebe065b6d81ff57acc4c81464d6ce8e8488a67391e0d51f2707ebc4ea474d86fa6c52d22adefd141f7236d6f99da046f4945c4773e6ff5f100eb4f29ed
CMD npm start