FROM ubuntu@sha256:149d67e29f765f4db62aa52161009e99e389544e25a8f43c8c89d4a445a7ca37 as ubuntu-base
RUN apt-get update
# Base dependencies
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y openscad time tzdata 7zip
# Install openroad from package
ADD https://github.com/Precision-Innovations/OpenROAD/releases/download/2023-12-12/openroad_2.0_amd64-ubuntu22.04-2023-12-12.deb /tmp/openroad.deb
RUN apt install -y /tmp/openroad.deb
RUN rm /tmp/openroad.deb
# Install klayout from package
ADD https://www.klayout.org/downloads/Ubuntu-22/klayout_0.28.14-1_amd64.deb /tmp/klayout.deb
RUN apt-get install -y /tmp/klayout.deb
RUN rm /tmp/klayout.deb
# Python package installation
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y python3-pip python3
RUN python3 -m pip install --no-cache-dir notebook jupyterlab
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt
RUN apt remove -y python3-pip
RUN apt autoremove -y
RUN apt-get clean

FROM ubuntu-base
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

ENV PATH="$PATH:/opt/or_tools/bin"
ENV OPENROAD_FLOW_DIR=/home/jovyan/openroad_flow
ENV SCAD_FLOW_DIR=/home/jovyan/scad_flow
ENV SCAD_DIR=$SCAD_FLOW_DIR/scad
ENV SCAD_FLOW_DESIGN_DIR=$SCAD_FLOW_DIR/designs

ENV OPENROAD_EXE=openroad
ENV KLAYOUT_CMD=klayout
ENV TIME_CMD=/usr/bin/time
# OpenROAD result directory
ENV OR_RESULTS=$OPENROAD_FLOW_DIR/results

# SCAD result directories
ENV RESULTS_DIR=results
WORKDIR ${HOME}
