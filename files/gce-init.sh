#!/bin/bash -x

PATH=$PATH:/opt/google-cloud-sdk/bin

#gcloud auth login

for i in aio puppetdb mco; do
  gcloud config set project pe-er-$i && \
  puppet apply /etc/puppetlabs/puppet/environments/production/modules/testbed/tests/testbed_gce_$i.pp \
    --certname pe-er-$i --debug
done
