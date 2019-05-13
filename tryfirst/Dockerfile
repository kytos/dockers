FROM kytos/base

RUN python3.6 -m pip install --upgrade pip setuptools wheel
RUN python3.6 -m pip install kytos==2019.1b1

EXPOSE 6633
EXPOSE 8181

ADD kytos-welcome.txt /tmp/kytos-welcome.txt
ADD init.sh /init.sh
CMD /bin/bash /init.sh
