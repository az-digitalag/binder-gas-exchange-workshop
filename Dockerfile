FROM rocker/binder:3.6.3

# Copy repo into ${HOME}, make user own $HOME
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}
  
## run any apt.txt and install.R scripts we find
RUN if [ -f apt.txt ]; then R --quiet -f apt.txt; fi
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
