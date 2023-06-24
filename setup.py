#!/usr/bin/env python

from setuptools import find_packages, setup

setup(
    name="assignment4",
    version="0.0.1",
    description="PyTorch Lightning Project Setup",
    author="",
    author_email="",
    url="https://github.com/user/project",
    install_requires=["lightning", "hydra-core"],
    packages=find_packages(),
    # use this to customize global commands available in the terminal after installing the package
    entry_points={
        "console_scripts": [
            "assignment4_train = assignment4.train:main",
            "assignment4_eval = assignment4.eval:main",
        ]
    },
)
