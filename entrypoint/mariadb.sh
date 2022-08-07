#! /bin/bash

#####################################################################
#                                                                   #
#  ██████╗░███████╗░█████╗░██╗░░░░░███╗░░░███╗                      #
#  ██╔══██╗██╔════╝██╔══██╗██║░░░░░████╗░████║                      #
#  ██████╔╝█████╗░░███████║██║░░░░░██╔████╔██║                      #
#  ██╔══██╗██╔══╝░░██╔══██║██║░░░░░██║╚██╔╝██║                      #
#  ██║░░██║███████╗██║░░██║███████╗██║░╚═╝░██║                      #
#  ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝                      #
#                                                                   #
#  ██╗░░░░░██╗███╗░░██╗██╗░░░██╗██╗░░██╗  ██████╗░░█████╗░██╗░░██╗  #
#  ██║░░░░░██║████╗░██║██║░░░██║╚██╗██╔╝  ██╔══██╗██╔══██╗╚██╗██╔╝  #
#  ██║░░░░░██║██╔██╗██║██║░░░██║░╚███╔╝░  ██████╦╝██║░░██║░╚███╔╝░  #
#  ██║░░░░░██║██║╚████║██║░░░██║░██╔██╗░  ██╔══██╗██║░░██║░██╔██╗░  #
#  ███████╗██║██║░╚███║╚██████╔╝██╔╝╚██╗  ██████╦╝╚█████╔╝██╔╝╚██╗  #
#  ╚══════╝╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝  ╚═════╝░░╚════╝░╚═╝░░╚═╝  #
#                                                                   #
#####################################################################

result=$(service mariadb status | grep "started" >/dev/null 2>&1)

while true; do

    if [[ -z "$result" ]]; then
        echo "MariaDB Server is not running."
        echo ""
        echo "I am attempting to start the MariaDB Server."
        /usr/bin/mysqld_safe --datadir='/var/lib/mysql >/dev/null 2>&1'
        rc-service mariadb start
        echo ""
        alias update='apk update && apk upgrade'
        export HISTTIMEFORMAT="%d/%m/%y %T "
        export PS1='\u@\h:\W \$ '
        alias l='ls -CF'
        alias la='ls -A'
        alias ll='ls -alF'
        alias ls='ls --color=auto'
        source /etc/profile.d/bash_completion.sh
        export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "
        break
    else
        echo "MariaDB Server is already started"
        exec 3>/dev/null
    fi
done
echo "" && echo "" && echo "" && echo "" && echo ""
exec "$@"
