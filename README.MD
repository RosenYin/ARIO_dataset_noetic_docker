# 数据集采集

## clone

```shell
git clone https://github.com/RosenYin/ARIO_dataset_noetic_docker.git

git submodule update --init --recursive
```

## docker noetic

First,Keep the network connection stable.

### docker pull

```bash
docker pull osrf/ros:noetic-desktop-full
```

### docker run

```bash
cd ./.devcontainer
docker-compose up -d
```

### docker exec

```bash
docker exec -it  noetic /bin/zsh
```

### build

```shell
cd /workspace/ARIO-dataset-agilex
catkin_make
```

### run

```shell
source devel/setup.sh

```
