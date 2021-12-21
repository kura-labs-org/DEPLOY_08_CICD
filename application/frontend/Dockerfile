FROM node:16
WORKDIR /usr/src/app
COPY ./application/frontend/package*.json ./
RUN npm install
COPY ./application/frontend/ .
EXPOSE 3000
CMD ["npm", "run", "start"]