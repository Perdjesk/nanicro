FROM ubuntu

RUN apt-get update && apt-get install -y curl unzip python

ADD app.sh /app.sh

RUN chmod +x /app.sh
RUN /app.sh

