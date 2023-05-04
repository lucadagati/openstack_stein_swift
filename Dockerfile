#TO BE RUN AS
#docker run -dit --privileged --name openstack-stein-container --net=host -v /sys/fs/cgroup:/sys/fs/cgroup:ro openstack

# Utilizzare l'immagine di base di Ubuntu 18.04
FROM ubuntu:18.04

ENV container docker
RUN apt-get update && apt-get install -y systemd && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && rm -f /lib/systemd/system/multi-user.target.wants/* \
    && rm -f /etc/systemd/system/*.wants/* \
    && rm -f /lib/systemd/system/local-fs.target.wants/* \
    && rm -f /lib/systemd/system/sockets.target.wants/*udev* \
    && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
    && rm -f /lib/systemd/system/basic.target.wants/* \
    && rm -f /lib/systemd/system/anaconda.target.wants/*

RUN ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime && echo "Europe/Rome" > /etc/timezone

# Aggiorna i pacchetti e installa le dipendenze necessarie
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    software-properties-common \
    curl \
    iproute2

# Aggiungi il repository OpenStack Stein
RUN add-apt-repository cloud-archive:stein -y

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    sudo \
    net-tools \
    dialog \
    mariadb-server \
    iputils-ping \
    wget \
    vim  \
    git  \
    net-tools \
    chrony \
    python-pymysql \
    rabbitmq-server \
    memcached \
    python-memcache \
    keystone \
    glance \
    placement-api \
    swift \
    swift-proxy \
    python-swiftclient \
    python-keystoneclient \
    python-keystonemiddleware \
    xfsprogs \
    rsync \
    nova-api \
    nova-conductor \
    nova-consoleauth \
    nova-novncproxy \
    nova-scheduler \
    nova-compute \
    neutron-server \
    neutron-plugin-ml2 \
    neutron-linuxbridge-agent \
    neutron-l3-agent \
    neutron-dhcp-agent \
    neutron-metadata-agent \
    openstack-dashboard \
    python3-openstackclient
    
    # Clona il repository di installazione di OpenStack
RUN git clone https://github.com/lucadagati/openstack_stein_swift.git /openstack_stein_swift

# Imposta la directory di lavoro
WORKDIR /openstack_stein_swift

# Esegui lo script di installazione di OpenStack Stein
RUN chmod +x Stein_Installation.sh

# Imposta il comando di default del container
#CMD cd /openstack_stein_swift && /bin/bash -c "./Stein_Installation.sh"
CMD ["/sbin/init"]




