FROM registry.access.redhat.com/rhel7

RUN \
    rpm -i http://rhos-release.virt.bos.redhat.com/repos/rhos-release/rhos-release-latest.noarch.rpm && \    
    rhos-release 13-director -p 2019-05-15.1 && \
    yum update -y

RUN \
   yum install -y tcpdump iproute net-tools openstack-nova-compute openstack-nova-migration openstack-neutron-ml2 openstack-neutron-openvswitch openstack-neutron-fwaas openstack-neutron

COPY ./nova.conf.fragment /etc/nova/
COPY ./neutron.conf.fragment /etc/neutron/
COPY ./openvswitch_agent.ini.fragment /etc/neutron/
COPY ./hosts /
COPY ./openvswitch_agent.ini /
COPY ./neutron.conf /
COPY ./nova.conf /

COPY ./fake_vif.py /fake_vif.py
COPY ./write_config.py /write_config.py
COPY ./entrypoint.sh /entrypoint.sh

RUN \
        chmod 0755 /write_config.py /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

