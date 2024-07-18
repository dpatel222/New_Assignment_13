# pull official base image
FROM node:20.12.2-alpine

# set working directory
WORKDIR deep_patel_ui_garden_build_checks

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm ci


# add app
COPY . ./

EXPOSE 8018
# start app
CMD ["npm", "start"]