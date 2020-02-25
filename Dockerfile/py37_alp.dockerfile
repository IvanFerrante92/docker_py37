FROM ubuntu

RUN apt-get update && apt-get install -y \
    git \
    python3.7 \
    python-pip \

RUN pip install --upgrade pip
RUN pip install virtualenv  
RUN rm -f /usr/bin/python
RUN cp /usr/bin/python3.7 /usr/bin/python


CMD [ "/bin/bash"]

