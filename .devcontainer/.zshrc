#在卸载 zsh 之前请先更换默认终端。 
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.8
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#自己的source
source /opt/ros/$ROS_DISTRO/setup.zsh
# 环境变量
# export ROS_IP=192.168.3.3	#主机跑ROS的IP
# export ROS_HOSTNAME=192.168.3.3	#主机跑ROS的IP
# export ROS_MASTER_URI=http://192.168.3.3:11311	#主机跑ROS的IP，11311不要更改
export ROS_HOSTNAME=localhost	#主机跑ROS的IP
export ROS_MASTER_URI=http://localhost:11311
PYTHONPATH="${PYTHONPATH}:/opt/ros/$ROS_DISTRO/lib/python3/dist-packages"
export PYTHONPATH

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
export LD_LIBRARY_PATH=:$LD_LIBRARY_PATH

export LD_LIBRARY_PATH=:$LD_LIBRARY_PATH

export MVCAM_COMMON_RUNENV=/opt/MVS/lib
export LD_LIBRARY_PATH=/opt/MVS/lib/64:/opt/MVS/lib/32:$LD_LIBRARY_PATH
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 命令补全
autoload -U compinit
compinit

# 查找历史记录
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

# 消除历史记录中的重复条目
setopt HIST_IGNORE_DUPS

# 命令提示符
autoload -U promptinit
promptinit

#添加下面的配置可以启动使用方向键控制的自动补全： 
zstyle ':completion:*' menu select

#一般来说，compinit 不会自动在 $PATH 里面查找新的可执行文件。例如当你安装了一个新的软件包，/usr/bin 里的新文件不会立即自动添加到自动补全当中。所以你需要执行下面的命令来将它们添加进自动补全： rehash
#这个 'rehash' 可以被放到你的 zshrc 来自动执行
zstyle ':completion:*' rehash true

#按两次 tab 键启动菜单,添加下面的配置可以启动命令行别名的自动补全： 
setopt completealiases

#历史记录保存
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# 添加通配符功能
setopt nonomatch

# 增加显示端口
export DISPLAY=:0
