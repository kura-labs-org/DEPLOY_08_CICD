FROM node:latest

WORKDIR /app

COPY package.json ./
COPY package-lock.json ./
RUN npm install

COPY . ./

# Start react app
CMD ["npm", "start"]
