#!/bin/bash

openstack overcloud deploy \
--timeout 100 \
--templates /usr/share/openstack-tripleo-heat-templates \
--stack overcloud \
--ntp-server clock.redhat.com \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /home/stack/network-environment.yaml \
-e /home/stack/nodes_data.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/disable-telemetry.yaml \
-e /home/stack/templates/overcloud_images.yaml \
-e /home/stack/neutron_defaults.yaml \
-n /home/stack/network_data.yaml
