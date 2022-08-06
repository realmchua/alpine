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

if [[ -z "${NGINX_ENTRYPOINT_QUIET_LOGS:-}" ]]; then
    
    service nginx status | grep 'started' > /dev/null 2>&1
    
    if [[ $? != 0 ]]; then
        
        echo 'Starting nginx [engine-x] child...'
        rc-service nginx start &
        child=$!
        
        echo 'Waiting for nginx [engine-x] child process...'
        wait $child  > /dev/null 2>&1
        
    fi
    
    service php-fpm81 status | grep 'started' > /dev/null 2>&1
    
    if [[ $? != 0 ]]; then
        
        echo 'Starting PHP-FPM (FastCGI Process Manager)...'
        rc-service php-fpm81 start > /dev/null 2>&1
        
    fi
    
    alias update='apk update && apk upgrade'
    export HISTTIMEFORMAT="%d/%m/%y %T "
    export PS1='\u@\h:\W \$ '
    alias l='ls -CF'
    alias la='ls -A'
    alias ll='ls -alF'
    alias ls='ls --color=auto'
    source /etc/profile.d/bash_completion.sh
    export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "
    
else
    exec 3>/dev/null
fi

_quit () {
    echo 'Caught sigquit, sending SIGQUIT to child'
    kill -s QUIT $child;
}

trap _quit SIGQUIT;

echo "" && echo "" && echo "" && echo "" && echo ""

exec "$@"
