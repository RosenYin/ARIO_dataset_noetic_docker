# base image from noetic
FROM osrf/ros:noetic-desktop-full

# 换源
# RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
# COPY .devcontainer/sources.list /etc/apt/

# 安装各种工具
RUN apt update -yq && apt upgrade -yq && \
apt install -y curl sudo zsh zsh-autosuggestions zsh-syntax-highlighting byobu

RUN chsh -s /bin/zsh \
    && echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc \
    && echo "source /opt/ros/noetic/setup.zsh" >> /root/.zshrc \
    && echo "export net.ipv4.ip_forward=1" >> /etc/sysctl.conf \
    && /bin/bash -c "source /root/.bashrc" \
    && /bin/zsh -c "source /root/.zshrc" \
    && rm -rf /var/lib/apt/lists/*

# 设置参数，以添加用户
ARG user=noetic
# 添加用户，密码是1
RUN useradd --create-home --no-log-init --shell /bin/zsh ${user} \ 
    && adduser ${user} sudo \ 
    && echo "${user}:1" | chpasswd \ 
    && usermod -u 1000 ${user} && usermod -G 1000 ${user} \ 
    && echo "%${user} ALL=(ALL:ALL) ALL" >> /etc/sudoers \ 
    && echo "%${user} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p /home/${user}/software/powerlevel10k

COPY .devcontainer/powerlevel10k /home/${user}/software/powerlevel10k
# 复制.zshrc
COPY .devcontainer/.zshrc /home/${user}
COPY .devcontainer/.p10k.zsh /home/${user}
RUN echo "source /home/${user}/software/powerlevel10k/powerlevel10k.zsh-theme" >> /home/${user}/.zshrc \
    && echo "source /home/${user}/.zshrc" >> /root/.zshrc
# 设置UTF-8中文，防止乱码
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
# 进行健康检查
HEALTHCHECK --interval=600s --timeout=20s \
  CMD curl -fs http://localhost/ || exit 1
# 切换到指定用户
USER ${user}