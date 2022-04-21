FROM ubuntu:20.04

# Install components
RUN apt-get update && apt-get -y upgrade \
    && DEBIAN_FRONTEND="noninteractive" TZ="America/New_York" apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && apt-get install -y gnupg software-properties-common curl awscli git vim nano jq python3-pip \
    && pip3 install ansible f5-sdk bigsuds netaddr objectpath isoparser lxml deepdiff \
    && curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
    && apt-get update && apt-get install -y terraform

# Copy Ansible init script to /usr/bin
COPY ansible-init.sh /usr/bin/ansible-init
RUN chmod +x /usr/bin/ansible-init

ENTRYPOINT [ "/bin/bash" ]
