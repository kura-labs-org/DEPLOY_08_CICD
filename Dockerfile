FROM openjdk:11
COPY . /home
WORKDIR /home
RUN apt-get update && apt-get install -y
RUN apt-get install nodejs npm -y
RUN npm install
EXPOSE 3000
RUN npm run start &
