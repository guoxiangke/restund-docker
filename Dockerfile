FROM ubuntu:14.04
MAINTAINER Matti Jokitulppo <matti.jokitulppo@aalto.fi>

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

RUN /usr/bin/patch -p1 < /restund/restund-auth.patch
RUN make
RUN make install

RUN cp /restund/restund.custom.conf /etc/restund.conf

RUN chmod +x /restund/start-restund.sh

EXPOSE 3478

CMD ["bash", "/restund/start-restund.sh"]

