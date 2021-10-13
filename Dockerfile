FROM python:3.10.0

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY requirements.txt /usr/src/app/

RUN mkdir /home/jenkins
RUN groupadd -g 984 jenkins
RUN useradd -r -u 984 -g jenkins -d /home/jenkins jenkins
RUN chown jenkins:jenkins /home/jenkins
USER jenkins


RUN pip install -r requirements.txt --user

USER root
# Bundle app source
COPY . /usr/src/app

EXPOSE 5000
USER jenkins
ENTRYPOINT ["python"]
CMD ["app.py"]
