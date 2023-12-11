#FROM debian@sha256:ab2b95aa8d7d6d54866b92c322cf0693933c1ae8038652f24ddfda1d1763a45a as debian-base
FROM openroad/ubuntu20-dev:7c40272b26b9af338a3bd5cd58118a9d003b894e as debian-base
RUN apt-get update
RUN apt-get install -y python3-pip openscad time
RUN python3 -m pip install --no-cache-dir notebook jupyterlab
# ADD https://github.com/Precision-Innovations/OpenROAD/releases/download/2023-12-01/openroad_2.0_amd64-debian11-2023-12-01.deb /tmp/
# RUN apt install -y /tmp/openroad_2.0_amd64-debian11-2023-12-01.deb
# RUN rm /tmp/openroad_2.0_amd64-debian11-2023-12-01.deb
ADD https://www.klayout.org/downloads/Ubuntu-20/klayout_0.28.14-1_amd64.deb /tmp/
RUN apt-get install -y /tmp/klayout_0.28.14-1_amd64.deb
RUN rm /tmp/klayout_0.28.14-1_amd64.deb
RUN apt-get clean
RUN mkdir -p /usr/local/share
RUN git clone https://github.com/The-OpenROAD-Project/OpenROAD.git /usr/local/share/openroad
WORKDIR /usr/local/share/openroad
RUN git checkout 7120a63613f5866e337d7e5fe48ebaf30a6b9f87
RUN git submodule update --init --recursive
RUN etc/Build.sh
RUN ln -s /usr/local/share/openroad/build/src/openroad /usr/local/bin/openroad
RUN pip3 install solidpython==1.1.3 numpy==1.23.5 pandas==1.5.2

FROM debian-base
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
