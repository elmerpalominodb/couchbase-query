#!/usr/bin/env python

import sys
import ez_setup
ez_setup.use_setuptools()

python_ver = float(sys.version[:3])
install_requires=[
    'PyYAML',
    'couchbase>=0.8',
]

if python_ver < 2.7:
    install_requires.append('argparse')

try:
    from logging import NullHandler
except ImportError:
    install_requires.append('logutils>=0.3')

from setuptools import setup, find_packages
setup(
    name='couchbase-query',
    version='0.1b.dev',
    author='PalominoDB',
    author_email='oss@palominodb.com',
    py_modules=["query"],
    url="http://pypi.python.org/pypi/python-couchbase-query",
    license='GPLv2',
    description=' Connects to a couchbase instance and returns the contents of bucket given a key',
    install_requires=install_requires,
    entry_points={
        'console_scripts': [
            'python-couchbase-query = query:main',
        ]
    }
)
