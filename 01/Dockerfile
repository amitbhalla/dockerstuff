# What is the base image
FROM node

# Change to working dir to ensure npm install in the workdir
WORKDIR /app

# Copy package.json to /app to run npm install
COPY package.json /app

# RUN - Executed when image is being build
RUN npm install

# Copy all items from this folder to /app inside the image
COPY . /app

# Exposes a port
EXPOSE 80

# CMD - Runs only when container is started
CMD ["node", "server.js"]