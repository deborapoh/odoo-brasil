FROM odoo:12.0

USER root

COPY . /mnt/extra-addons

RUN apt update -y

RUN apt install -y python-dev python3-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev \
  libxmlsec1-dev libxmlsec1-openssl libxmlsec1 gcc

RUN pip3 install --upgrade setuptools wheel

RUN cd /mnt/extra-addons && \
  pip3 install -r requirements.txt

USER odoo
