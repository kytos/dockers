Kytos Dockers
===

This is the official repository of the Docker images for [Kytos SDN Platform](https://kytos.io).

## Quick Start

First, just install docker from your package provider and choose one of the
following versions:

**Try First:** This version installs the latest pre-release Kytos version

**Nightly:** This version installs the latest uploaded Kytos version

## Running

First, clone this repo:

```console
   $ https://github.com/kytos/dockers.git
```

After cloning, run the following commands to start Docker container:

```console
   $ cd <version>
   $ sudo docker build -t <version> .
   $ sudo docker run -it -p <host_port>:<container_port> --privileged <version>
```

Then, execute kytos:

```console
    $ sudo docker exec -it <container_id> kytosd <kytos_parameters>
```

If you want to run any kytos-utils command, run:

```console
    $ sudo docker exec -it <container_id> kytos <kytos-utils_command>
```

**Parameters:**

- version: version to be executed (tryfirst, nightly)
- host_port: any port on the host
- container_port: port to be assigned in container (6653, 8181)
- container_id: identifier of Docker container
- kytos_parameters: any kytos parameter ([Configuring Kytos](https://docs.kytos.io/admin/configuring/))
- kytos-utils_command: any kytos-utils command, try *-h* to see a list of them

### Contributing

If you want to contribute to this project, please read [Kytos Documentation](https://docs.kytos.io/kytos/developer/how_to_contribute/) website.

### License

This software is under *MIT-License*. For more information please read
``LICENSE`` file.
