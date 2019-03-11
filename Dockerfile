FROM ubuntu:18.04

ARG USER

RUN apt-get update && \
  apt-get install -y git sudo && \
  useradd -ms /bin/bash $USER && \
  echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER

USER $USER

ENV SOURCE_DIRECTORY /home/$USER/src

WORKDIR /home/$USER

RUN touch /home/$USER/.sudo_as_admin_successful && \
  mkdir -p $SOURCE_DIRECTORY && \
  cd $SOURCE_DIRECTORY && \
  git clone https://github.com/jzaleski/home_dir.git && \
  cd home_dir && \
  ASSUME_YES=true EXTENDED_BOOTSTRAP=true bin/bootstrap.sh
