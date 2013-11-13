Couchbase Simple Query Tool
===========================

*Purpose: Connects to a couchbase instance and returns the contents of bucket given a key.*

Install Requirements
--------------------
`pip install -r requirements.txt`

Usage
-----
```
usage: query.py [-h] [-C CONFIG] [-H HOST] [-u USERNAME] [-p PASSWORD]
                [-b BUCKET] [-V VALUE]
                key

Couchbase Query Tool

positional arguments:
  key                   bucket key

optional arguments:
  -h, --help            show this help message and exit
  -C CONFIG, --config CONFIG
                        config file to load options from (default: None)
  -H HOST, --host HOST  host (default: localhost:8091)
  -u USERNAME, --username USERNAME
                        username (default: default)
  -p PASSWORD, --password PASSWORD
                        password (default: )
  -b BUCKET, --bucket BUCKET
                        bucket (default: default)
  -V VALUE, --value VALUE
                        value of key to set to (default: None)
```

Tests
-----
To run test writes and reads:
```
python tests.py
```


Extras
------

### Installing from an RPM package

For CentOS 6:

* Download an RPM package from the following link:
http://ci.palominodb.com:8080/job/python-couchbase-query-centos-6-x86_64/

* Enable EPEL repository
$ wget -N http://dl.fedoraproject.org/pub/epel/6/`uname -i`/epel-release-6-8.noarch.rpm
$ sudo rpm -Uvh epel-release-6-8.noarch.rpm

* Enable IUS repository
$ wget -N http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/ius-release-1.0-11.ius.centos6.noarch.rpm
$ sudo rpm -Uvh ius-release-1.0-11.ius.centos6.noarch.rpm

* Enable PDB repository
* create /etc/yum.repos.d/pdb.repo with the following contents:
[pdb]
name=PalominoDB Packages for Enterprise Linux 6 - $basearch
baseurl=http://yum.palominodb.com/centos/6/x86_64
enabled=1
gpgcheck=0

* Install script
$ sudo yum --nogpgcheck localinstall <RPM PACKAGE>

* Upon succesful installation, the following executable script should be available:
/usr/bin/python-couchbase-query
