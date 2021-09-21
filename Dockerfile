FROM ros:noetic-robot

# Basic build dependencies.
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

# Grab + install Drake binaries, mostly echoing the Docker build
# process from Drake itself..
ADD drake_binaries.tar.gz /opt

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update -qq \
  && apt-get install --no-install-recommends -o Dpkg::Use-Pty=0 -qy \
    $(cat /opt/drake/share/drake/setup/packages-focal.txt) \
  && rm -rf /opt/drake/share/drake/setup /var/lib/apt/lists/* \
  && mv /opt/drake/bin/drake-visualizer /opt/drake/bin/drake-visualizer.image
ENV LD_LIBRARY_PATH="/opt/drake/lib:${LD_LIBRARY_PATH}" \
  PATH="/opt/drake/bin:${PATH}" \
  PYTHONPATH="/opt/drake/lib/python3.8/site-packages:${PYTHONPATH}"

# Utilities for catkin build.
RUN  apt-get update \
  && apt-get install -y git tmux build-essential python3-pip gdb \
  && rm -rf /var/lib/apt/lists/*

#ENTRYPOINT ["/bin/bash", "-c", "/opt/ros/noetic/setup.bash"]
