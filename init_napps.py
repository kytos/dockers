#!/usr/bin/python3.6
# -*- coding: utf-8 -*-

import os
import socket
import subprocess
import time


def _get_env_napps(env_pattern='KYTOS_NAPP'):
    """Lists NAPPs environment variables that match env_pattern.
    :returns: list of variables

    """
    napps = []
    for k in os.environ.keys():
        if env_pattern in k:
            napps.append(os.environ.get(k))
    return napps


def _wait_kytosd():
    """Wait until kytosd starts running.

    """
    while True:
        time.sleep(1)
        if b'kytosd' in subprocess.check_output(["ps", "-aux"]):
            break

    ports = [6633, 6653]
    if os.environ.get('TCP_PORT'):
        ports = [int(os.environ.get('TCP_PORT'))]

    connected = False
    while not connected:
        try:
            time.sleep(1)
            for port in ports:
                s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                s.connect(('localhost', port))
                connected = True
                break
        except socket.error:
            pass


def _install_napp(napp):
    """Install Kytos napp

    :napp: Kytos Napp like 'kytos/of_core'

    """
    print("installing kytos napp {}".format(napp))
    ret = subprocess.call(["kytos", "napps", "install", napp])
    if ret != 0:
        raise ValueError("Napp {} couldn't be installed".format(napp))


def init_napps():
    """Init kytos napps

    """
    napps = _get_env_napps()
    if napps:
        print("Initializing NApps {}".format(napps))
        _wait_kytosd()
        for napp in napps:
            _install_napp(napp)
    else:
        print("No NApps to initialize")


if __name__ == "__main__":
    init_napps()
