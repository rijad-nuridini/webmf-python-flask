FROM jenkins/slave

RUN apt-get install python
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY requirements.txt /usr/src/app/

RUN pip install -r requirements.txt --user

# Bundle app source
COPY . /usr/src/app

EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py"]
