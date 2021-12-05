FROM ubuntu:latest
RUN apt-get update && apt-get install -y
WORKDIR /app
COPY . ./
RUN apt-get upgrade && DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" apt-get install install nodejs npm -y
RUN npm install
RUN npm run build
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "build"] 
