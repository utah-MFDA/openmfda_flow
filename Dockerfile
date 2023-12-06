FROM openroad/ubuntu22.04-dev@sha256:6ad0a685b06864fb2071b17337ced0b9753c9bf62b09dd4d21019cca8e5833eb

RUN apt-get update
RUN apt-get install -y python3-pip
RUN python3 -m pip install --no-cache-dir notebook jupyterlab
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
