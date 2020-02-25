FROM python:3.7-alpine

RUN apk add --no-cache bash \ 
   && apk add --update coreutils && rm -rf /var/cache/apk/* \
   && apk add --update python \
   python-dev \
   py-pip \
   build-base \
   && pip install virtualenv \
   && pip install prometheus_client \
   && rm -rf /var/cache/apk/*
RUN mkdir /trash
VOLUME /trash
WORKDIR /
COPY entrypoint.sh entrypoint.sh
COPY export_metrics.py export_metrics.py
RUN chmod 755 entrypoint.sh
RUN chmod 755 export_metrics.py
CMD [ "/bin/bash", "entrypoint.sh" ]

