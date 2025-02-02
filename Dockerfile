FROM ubuntu:18.04
LABEL updated_on="2021-10-27 09:00"
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install python3 python3-setuptools python3-pip gunicorn3
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
COPY simpleapp /flaskapp
WORKDIR /flaskapp
RUN pip3 install -r requirements.txt
EXPOSE 5000
ENTRYPOINT "./startup.sh"
