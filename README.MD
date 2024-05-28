# 数据集采集

## clone

```shell
git clone https://github.com/RosenYin/ARIO_dataset_noetic_docker.git
# 确保你本地仓库中的所有子模块（包括嵌套子模块）都被正确初始化和更新。
git submodule update --init --recursive
# 子模块中的代码始终与远程仓库的最新版本保持一致
git submodule update --remote
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
