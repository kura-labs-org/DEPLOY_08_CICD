FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y
COPY ./application/backend/ /home/ubuntu/app/
WORKDIR /home/ubuntu/app/
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN apt-get install python3-dev default-libmysqlclient-dev build-essential -y
RUN pip3 install -r requirments.txt
EXPOSE 5000
CMD ["python3", "app.py"] 