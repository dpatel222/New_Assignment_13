# Use an official Node.js runtime as a parent image
FROM node:20.12.2-alpine

# Set the working directory
WORKDIR /deep_patel_ui_garden_build_checks

# Add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm ci

# Add app source code
COPY . ./

# Expose the port the app runs on
EXPOSE 3000

# Command to run the development server
CMD ["npm", "run", "start"]
