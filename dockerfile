FROM bitnami/jenkins
LABEL maintainer "Tim Phillips <tim@ephillips.net>"

## Change user to perform privileged actions
USER 0

## Setup Prequisites
RUN install_packages wget gnupg software-properties-common

## Setup 'Hashicorp Repo'
#RUN mkdir -p /etc/apt/keyrings
#RUN wget -qO - terraform.gpg https://apt.releases.hashicorp.com/gpg | gpg --batch --yes --dearmor -o /usr/share/keyrings/terraform-archive-keyring.gpg
#RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/terraform-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/terraform.list


RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"


## Install packages
RUN install_packages nano ansible packer terraform python3 git awscli software-properties-common
## Revert to the original non-root user
USER 1001