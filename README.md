# Docker wrapper of [gizatt/drake_hydra_interact](https://github.com/gizatt/drake_hydra_interact).

## Usage
1) `git clone https://github.com/gizatt/drake_hydra_interact_docker`
2) `git submodule update --init --recursive`
3) Install hydra udev rule: `sudo cp catkin_ws/src/razer_hydra/config/99-hydra-indigo.rules /etc/udev/rules.d/` and replug your Hydra. It should now appear at `/dev/hydra`.
3a) [Optional] Build docker container with `docker_build.sh`. You'll first have to supply drake binaries as `drake-binaries.tar.gz` in this folder. 
3) `./docker_run`
4) Now inside the container, build the tools using `cd catkin_ws && ./do_build.sh`.
5) (Do whatever you need inside the container; current workflow is `tmux`, `. ./setup_env.sh`, `roslaunch razer_hydra hydra.launch` in one window, and `rosrun drake_hydra_interact <script>` in another.)