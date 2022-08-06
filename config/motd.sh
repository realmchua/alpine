#!/usr/bin/env bash

alias update='apk update && apk upgrade'
export HISTTIMEFORMAT="%d/%m/%y %T "
export PS1='\u@\h:\W \$ '
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
source /etc/profile.d/bash_completion.sh
export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "

clear

# * ASCII head
echo ""
echo "    ██████╗░███████╗░█████╗░██╗░░░░░███╗░░░███╗██╗░██████╗          "
echo "    ██╔══██╗██╔════╝██╔══██╗██║░░░░░████╗░████║╚█║██╔════╝          "
echo "    ██████╔╝█████╗░░███████║██║░░░░░██╔████╔██║░╚╝╚█████╗░          "
echo "    ██╔══██╗██╔══╝░░██╔══██║██║░░░░░██║╚██╔╝██║░░░░╚═══██╗          "
echo "    ██║░░██║███████╗██║░░██║███████╗██║░╚═╝░██║░░░██████╔╝          "
echo "    ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░░░╚═════╝░          "
echo ""
echo "    ██╗░░░░░██╗███╗░░██╗██╗░░░██╗██╗░░██╗  ██████╗░░█████╗░██╗░░██╗ "
echo "    ██║░░░░░██║████╗░██║██║░░░██║╚██╗██╔╝  ██╔══██╗██╔══██╗╚██╗██╔╝ "
echo "    ██║░░░░░██║██╔██╗██║██║░░░██║░╚███╔╝░  ██████╦╝██║░░██║░╚███╔╝░ "
echo "    ██║░░░░░██║██║╚████║██║░░░██║░██╔██╗░  ██╔══██╗██║░░██║░██╔██╗░ "
echo "    ███████╗██║██║░╚███║╚██████╔╝██╔╝╚██╗  ██████╦╝╚█████╔╝██╔╝╚██╗ "
echo "    ╚══════╝╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝  ╚═════╝░░╚════╝░╚═╝░░╚═╝ "
echo ""

# * Messages
echo ""
echo " A docker image based on Alpine Linux with OpenRC's init system and"
echo " pre-built with Nginx, PHP 8.1-FPM, MYSQL and acme.sh's SSL client."
echo ""
echo " Build and maintained by: Realm Chua <realm at mylinuxbox dot cloud>"
echo ""
echo " https://github.com/realmchua/rc-alpine-nginx/"
echo " https://hub.docker.com/repository/docker/realmsg/rc-alpine-nginx/"
echo ""
echo " Disclaimer: please visit https://pkgs.alpinelinux.org/ to view"
echo " the license information for the software contained in this image."
echo ""
echo " As with all Docker images, these likely also contain other software"
echo " which may be under additional licenses (such as bash, etc.,"
echo " from the base distribution, along with any direct or indirect dependencies"
echo " of the primary software being contained)."
echo ""
echo " As for any pre-built image usage, it is the image user's responsibility"
echo " to ensure that any use of this image complies with any relevant licenses"
echo " for all software contained within."
echo ""
echo ""

# * Print Output
get_name() {
  whoami
}
if [[ "$(get_name)" == "root" ]]; then
  (uptime; echo "")
  (echo " Welcome Administrator, I'm currently now in $PWD"; echo "";  echo "")
elif [[ "$(get_name)" != "root" ]]; then
  (uptime; echo "")
  (echo " Welcome $(get_name), I'm currently now in $PWD"; echo "";  echo "")
fi
