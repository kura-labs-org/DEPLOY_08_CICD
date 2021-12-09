FROM python:3.10
COPY ./application/backend/ /root/flask
WORKDIR /root/flask
RUN apt-get update && apt install python3-pip -y
RUN pip3 install -r requirements.txt
ENV FLASK_APP=application.py
EXPOSE 5000
CMD flask run --host=0.0.0.0