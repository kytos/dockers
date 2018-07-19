FROM kytos/base

RUN python3.6 -m pip install kytos==2018.1

EXPOSE 6633

ADD kytos-welcome.txt /tmp/kytos-welcome.txt
ADD init.sh /init.sh
CMD /bin/bash /init.sh
