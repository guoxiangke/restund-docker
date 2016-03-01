FROM ubuntu:14.04
MAINTAINER Matti Jokitulppo <matti.jokitulppo@aalto.fi>

ENV RESTUND_VERSION 0.4.12
ENV RE_VERSION 0.4.15

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install g++ make curl -y

RUN mkdir /re
RUN mkdir /restund

RUN curl -O "http://www.creytiv.com/pub/restund-0.4.12.tar.gz"
RUN tar --strip-components=1 -xf restund-0.4.12.tar.gz -C /restund

RUN curl -O "http://www.creytiv.com/pub/re-0.4.15.tar.gz"
RUN tar --strip-components=1 -xf re-0.4.15.tar.gz  -C /re

ADD . /restund

WORKDIR /re
RUN make
RUN make install

WORKDIR /restund
RUN make
RUN make install

EXPOSE 3478

CMD ["bash", "/restund/start-restund.sh"]

