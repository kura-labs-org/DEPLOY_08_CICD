FROM openjdk:11
COPY ./public /home/public
COPY ./src /home/src
COPY package.json /home
COPY package-lock.json /home
WORKDIR /home
RUN apt-get update && apt-get install -y
RUN apt-get install nodejs npm -y
RUN npm install
RUN npm run build
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s"] 
