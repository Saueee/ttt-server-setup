FROM httpd:2.4

ENV TTT_VERSION 1.10
RUN apt-get update
RUN apt-get install unzip
RUN apt-get install -y wget
COPY ./entry.sh ./entry.sh
CMD ["bash", "entry.sh"]
