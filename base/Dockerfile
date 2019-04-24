# This is base image used by Kytos project
# Here we only install ubuntu, few dependencies and clone all repos
FROM ubuntu:18.04

ENV LANG C.UTF-8

ARG CACHE_DATE=2016-01-01

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends\
    git vim python3.6 python3-setuptools python3-pip \
    curl iproute2 iputils-ping mininet net-tools tcpdump syslog-ng tmux screen \
    && rm -rf /var/lib/apt/lists/* \
    && mv /bin/ping /sbin/ping \
    && mv /bin/ping6 /sbin/ping6 \
    && mv /usr/sbin/tcpdump /usr/bin/tcpdump


# Replace the system() source because inside Docker we can't access /proc/kmsg.
# https://groups.google.com/forum/#!topic/docker-user/446yoB0Vx6w
RUN	sed -i -E 's/^(\s*)system\(\);/\1unix-stream("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf
# Uncomment 'SYSLOGNG_OPTS="--no-caps"' to avoid the following warning:
# syslog-ng: Error setting capabilities, capability management disabled; error='Operation not permitted'
# http://serverfault.com/questions/524518/error-setting-capabilities-capability-management-disabled#
RUN	sed -i 's/^#\(SYSLOGNG_OPTS="--no-caps"\)/\1/g' /etc/default/syslog-ng
