# Use baseimage-docker's init system.
FROM phusion/baseimage:0.10.0
LABEL maintainer "viniciusarcanjov@gmail.com"
CMD ["/sbin/my_init"]

# Add python3.6 ppa
RUN add-apt-repository ppa:jonathonf/python-3.6 -y

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    python3.6 python3.6-dev python3.6-venv \
    git

# bootstrap pip3.6
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# workdir
ENV DIR /app
WORKDIR $DIR

# Python requirements
COPY kytos/requirements $DIR/requirements
COPY kytos/setup.py $DIR

# Kytos project, metadata for setup, bin, etc
COPY kytos/kytos $DIR/kytos/
COPY kytos/bin $DIR/bin/
COPY kytos/etc $DIR/etc/

RUN pip3.6 install -r requirements/dev.txt

RUN mkdir -p /etc/my_init.d
COPY init_napps.py /etc/my_init.d/12_init_napps.py

COPY init_napps.sh /etc/my_init.d/13_init_napps.sh
RUN chmod +x /etc/my_init.d/13_init_napps.sh

COPY kytos.sh /etc/my_init.d/15_kytos.sh
RUN chmod +x /etc/my_init.d/15_kytos.sh

COPY kytosrc /root/.kytosrc
