FROM node:16.3.0
RUN apt-get update && apt-get install -y
WORKDIR /app
COPY . ./
RUN npm install
RUN npm run build
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "build"] 
