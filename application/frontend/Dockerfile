FROM ubuntu:latest
RUN apt-get update && apt-get install -y
COPY ./application/frontend/ /home/ubuntu/app/
WORKDIR /home/ubuntu/app/
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install nodejs -y
RUN apt-get install npm -y
RUN npm install
RUN npm run build
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "build"] 
