FROM cm2network/csgo:sourcemod

USER root
ENV TTT_VERSION 1.10
RUN apt-get update && apt-get install unzip
USER ${USER}
COPY ./entry.sh ./entry.sh
COPY ./ttt-config.zip ./ttt-config.zip

CMD ["bash", "entry.sh"]
