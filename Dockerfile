FROM quay.io/fenicsproject/stable:latest


# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}
ENV PYVISTA_OFF_SCREEN true
ENV PYVISTA_USE_PANEL true
ENV PYVISTA_PLOT_THEME document
# This is needed for Panel - use with cuation!
ENV PYVISTA_AUTO_CLOSE false
RUN adduser --disabled-password \
    --gecos "Default user" \
    ${NB_USER}
WORKDIR ${HOME}
USER root
COPY . ${HOME}

RUN chown -R ${NB_USER} ${HOME}
USER ${USER}
