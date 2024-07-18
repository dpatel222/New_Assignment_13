# UI Component Library

This project is a UI Component Library that runs on `localhost:8018`. The project uses Husky for pre-commit hooks to ensure code quality and GitHub Actions for continuous integration.

## Getting Started

### Husky Pre-commit Hooks

This project uses Husky to run pre-commit checks. The following checks are performed before each commit:

- Prettier
- ESLint
- Tests

#### Setting up Husky

1. Install Husky:

   ```bash
   npm install husky --save-dev
   ```

2. Initialize Husky:

   ```bash
   npx husky install
   ```

3. Add the following to `package.json`:

   ```json
   {
     "husky": {
       "hooks": {
         "pre-commit": "npm run lint && npm run prettier-check && npm test"
       }
     }
   }
   ```

4. Created the necessary scripts in `package.json`:

   ```json
   {
     "scripts": {
       "format": "prettier --write '**/*.{js,jsx,ts,tsx}'",
       "lint": "eslint src/",
       "test_skip": "CI=true react-scripts test"
     }
   }
   ```

### GitHub Actions

GitHub Actions is used for continuous integration to ensure code quality on every push.

#### Setting up GitHub Actions

1. Created a `.github/workflows/deploy.yml` file with the following content:

   ```yaml
   name: prettier_format_and_ESLINT
   ```

on:
push:
branches: ["main"]

jobs:
test:
name: Check the source code
runs-on: ubuntu-latest
steps: - uses: actions/checkout@v2 - name: Install packages
run: npm ci - name: Prettier
run: npm run format - name: Lint
run: npm run lint - name: Jest Test
run: npm run test_skip

````

## DockerFile

Created a `DockerFile` with the following content:

```dockerfile
# Use an official Node.js runtime as a parent image
FROM node:20.12.2-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 8018

# Define the command to run the app
CMD [ "npm", "start" ]
````
