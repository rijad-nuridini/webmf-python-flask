FROM jenkins/slave

USER root
RUN apt-get update
RUN apt-get install python3 python3-pip -y
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY requirements.txt /usr/src/app/

RUN pip3 install -r requirements.txt --user

# Bundle app source
COPY . /usr/src/app

EXPOSE 5000
USER jenkins
ENTRYPOINT ["python3"]
CMD ["app.py"]
