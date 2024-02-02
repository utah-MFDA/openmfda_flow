FROM gcr.io/hdl-containers/debian/bullseye/pkg/klayout@sha256:3cfdde9b4d22e7b760ae52743649febfaac5d97b3bbdc8f22981dd9c2831065a as klayout
FROM gcr.io/hdl-containers/debian/bullseye/pkg/xyce@sha256:ed21fd7449c0a3af3bf11b38aea788bf0495924977915482d5a829763c740976 as xyce
FROM gcr.io/hdl-containers/debian/bullseye/pkg/openroad@sha256:5d2aa78c385116d822c5d6e1302e44ef0c659a0294db12c8ded1e87d716afd8f as openroad

# Start with OpenROAD container
FROM gcr.io/hdl-containers/openroad@sha256:c7f156bf9d9042344362b2180855e8df976f11f95fbe22613ffd742c61d2b7aa

# COPY --from=openroad /openroad/usr /usr/
# COPY --from=openroad /or-tools/bin /usr/local/bin/
# COPY --from=openroad /or-tools/include /usr/local/include/
# COPY --from=openroad /or-tools/lib /usr/local/lib/
# COPY --from=openroad /or-tools/share /usr/local/share/
COPY --from=klayout /klayout/usr /usr/
COPY --from=xyce /xyce/usr /usr/

# Our requirements
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install --no-install-recommends openscad time tzdata p7zip-full python3 make

# Klayout requirements
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install --no-install-recommends libpulse-mainloop-glib0 libpython3.9 libqt5core5a libqt5designer5 libqt5gui5 libqt5multimedia5 libqt5multimediawidgets5 libqt5printsupport5 libqt5sql5 libqt5svg5 libqt5widgets5 libqt5xml5 libqt5xmlpatterns5 libruby

# Xyce requirements
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install --no-install-recommends ca-certificates libamd2 libgfortran5 libfftw3-3 libblas3 liblapack3 libsuitesparseconfig5

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN  apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip
RUN python3 -m pip install --no-cache-dir notebook jupyterlab
COPY requirements.txt /tmp/requirements.txt
RUN python3 -m pip install --no-cache-dir -r /tmp/requirements.txt

COPY --chown=${NB_UID}:${NB_UID} . ${HOME}

RUN DEBIAN_FRONTEND=noninteractive apt remove -y python3-pip \
    && apt-get autoclean && apt-get clean && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

USER ${NB_USER}

ENV OPENROAD_FLOW_DIR=/home/jovyan/openroad_flow
ENV SCAD_FLOW_DIR=/home/jovyan/scad_flow
ENV SCAD_DIR=$SCAD_FLOW_DIR/scad
ENV SCAD_FLOW_DESIGN_DIR=$SCAD_FLOW_DIR/designs

ENV OPENROAD_EXE=openroad
ENV KLAYOUT_CMD=klayout
ENV TIME_CMD=time
# OpenROAD result directory
ENV OR_RESULTS=$OPENROAD_FLOW_DIR/results

# SCAD result directories
ENV RESULTS_DIR=results
WORKDIR ${HOME}
