FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

# Path _inside_ of the container which should be saved
# This creates a persistent volume which will survive 
# deletion of container
VOLUME [ "/app/feedback" ]

CMD ["node", "server.js"]