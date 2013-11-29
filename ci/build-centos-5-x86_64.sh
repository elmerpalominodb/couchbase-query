#!/bin/bash
set -x
set -e
sudo cp -u $WORKSPACE/tools/packaging/mock-target-configs/centos-5-x86_64-epel-ius-pdb.cfg /etc/mock/
rm -rf /home/jenkins/packages/python26-couchbase-query-centos-5-x86_64
rm -rf $WORKSPACE/results
mkdir -p $WORKSPACE/results
cd /home/jenkins/packages
cp -a buildroot.clean python26-couchbase-query-centos-5-x86_64
cd $WORKSPACE/tools/couchbase/python-query
python setup.py sdist -d /home/jenkins/packages/python26-couchbase-query-centos-5-x86_64/SOURCES/
cp $WORKSPACE/tools/couchbase/python-query/packaging/SPECS/CentOS/5/python26-couchbase-query.spec /home/jenkins/packages/python26-couchbase-query-centos-5-x86_64/SPECS/
cd /home/jenkins/packages/python26-couchbase-query-centos-5-x86_64
rpmbuild -bs --nodeps --define "dist %{nil}" --define "_source_filedigest_algorithm md5" SPECS/python26-couchbase-query.spec
for f in SRPMS/*.rpm; do mock -r centos-5-x86_64-epel-ius-pdb rebuild $f --resultdir=$WORKSPACE/results ; done
