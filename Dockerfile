FROM odoo:12.0

USER root

COPY . /mnt/extra-addons

RUN apt update -y
# RUN apt install -y build-essential autoconf libtool pkg-config \
#   python-opengl python-imaging python-pyrex python-pyside.qtopengl \
#   idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 \
#   libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus \
#   python-qt4 python-qt4-gl libgle3 python-dev

RUN apt install -y python-dev python3-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev \
  libxmlsec1-dev libxmlsec1-openssl libxmlsec1 gcc

RUN pip3 install --upgrade setuptools wheel

RUN cd /mnt/extra-addons && \
  pip3 install -r requirements.txt

USER odoo
