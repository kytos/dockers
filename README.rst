Kytos/dockers
#############

This repository is used to build all images created in the Kytos project.
Below we have all steps to create and publish a kytos image.

kytos/try-first
===============

How to build the image
----------------------

To create a `kytos/try-first <https://hub.docker.com/r/kytos/tryfirst/>` image
you need to edit the Docker file and change the kytos version.

.. code-block:: shell

  RUN python3.6 -m pip install kytos==<kytos-version>


After that you need to build the image using the following command:

.. code-block:: shell

  $ docker build -t kytos/tryfirst:<kytos-version> .

How to publish the image to DockerHub
--------------------------------------

First of all you need permission to publish in the dockerhub and follow the
steps below.

1 - logging using the command:

.. code-block:: shell

  $ docker login


2 - Make sure that you have the images built to upload :

.. code-block:: shell

  $ docker images
  REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
  kytos/tryfirst            2018.2b1            a02ee317fc80        4 weeks ago         332MB
  kytos/tryfirst            latest              a02ee317fc80        4 weeks ago         332MB

3 - Upload the docker images:

.. code-block:: shell

  $ docker push kytos/tryfirst:<version>


4 - The kytos/tryfirst was published.You can see the image in
`DockerHub <https://hub.docker.com/r/kytos/tryfirst/tags/>`__


kytos/nightly
=============

The `kytos/nightly <https://hub.docker.com/r/kytos/nightly/builds/>` is
scheduled to create a new build every midnight.  This scheduled is made using a
cron job.

