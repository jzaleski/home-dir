FROM ubuntu:22.04

ARG USER

RUN apt-get update && \
  apt-get install -y git sudo && \
  useradd -ms /bin/bash $USER && \
  echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER && \
  cd /usr/local && \
  git clone https://github.com/jzaleski/home-dir.git && \
  chown -R $USER:root home-dir

USER $USER

WORKDIR /home/$USER

RUN cd /home/$USER && \
  echo "home-dir" > .hostname && \
  mkdir -p src && \
  touch .nogitinfo .notags .norehash .sudo_as_admin_successful && \
  cd /usr/local/home-dir && \
  ASSUME_YES=true EXTENDED_BOOTSTRAP=true bin/bootstrap.sh
