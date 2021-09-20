#!/usr/bin/env bash
apt update
rosdep update
rosdep install --from-paths src --ignore-src -r -y
catkin_make
source ./devel/setup.bash