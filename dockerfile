FROM ubuntu:latest
COPY ./backend /home
WORKDIR /home/backend
RUN apt update && apt upgrade -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN cat test.txt
EXPOSE 5000
CMD ["python3", "app.py"]
