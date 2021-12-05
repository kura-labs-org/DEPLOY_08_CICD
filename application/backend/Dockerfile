FROM ubuntu:latest
RUN apt-get update && apt-get install -y
WORKDIR /app
COPY . ./
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN apt-get install python3-dev default-libmysqlclient-dev build-essential -y
WORKDIR /home/ubuntu/application/
RUN pip3 install -r requirements.txt
EXPOSE 5000
CMD ["python3", "app.py"] 
