FROM ubuntu:14.04
MAINTAINER Nathan Osman <nathan@quickmediasolutions.com>

# Download and install the buildbot slave and build-essential packages
RUN \
  apt-get update && \
  apt-get install -y buildbot-slave build-essential && \
  rm -rf /var/lib/apt/lists/*

# Copy the slave configuration and launching script
COPY buildbot.tac /var/lib/buildbot/slaves/slave/
COPY run.py /root/

# Enable the slave
COPY buildslave /etc/default/

# Command to setup the environment and launch the builder
CMD /root/run.py