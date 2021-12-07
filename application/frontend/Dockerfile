FROM node:latest
WORKDIR /usr/src/app
COPY ./application/frontend/package.json /usr/src/app
COPY ./application/frontend/package-lock.json /usr/src/app
RUN npm install
COPY ./application/frontend/ /usr/src/app
EXPOSE 3000
ENV NODE_SERVER_PORT=3000
CMD ["npm", "run", "start"]