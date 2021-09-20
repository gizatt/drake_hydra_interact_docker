docker run -it -v $(pwd)/catkin_ws:/catkin_ws --privileged -v /dev/hydra:/dev/hydra -p 6000:6000 -p 7000:7000 gizatt:drake_hydra_interact
