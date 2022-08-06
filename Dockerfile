############################################################################################################
# ██████╗░███████╗░█████╗░██╗░░░░░███╗░░░███╗██╗░██████╗  ██████╗░░█████╗░░█████╗░██╗░░██╗███████╗██████╗░ #
# ██╔══██╗██╔════╝██╔══██╗██║░░░░░████╗░████║╚█║██╔════╝  ██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔════╝██╔══██╗ #
# ██████╔╝█████╗░░███████║██║░░░░░██╔████╔██║░╚╝╚█████╗░  ██║░░██║██║░░██║██║░░╚═╝█████═╝░█████╗░░██████╔╝ #
# ██╔══██╗██╔══╝░░██╔══██║██║░░░░░██║╚██╔╝██║░░░░╚═══██╗  ██║░░██║██║░░██║██║░░██╗██╔═██╗░██╔══╝░░██╔══██╗ #
# ██║░░██║███████╗██║░░██║███████╗██║░╚═╝░██║░░░██████╔╝  ██████╔╝╚█████╔╝╚█████╔╝██║░╚██╗███████╗██║░░██║ #
# ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░░░╚═════╝░  ╚═════╝░░╚════╝░░╚════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝ #
#                                                                                                          #
# ░█████╗░██╗░░░░░██████╗░██╗███╗░░██╗███████╗                                                             #
# ██╔══██╗██║░░░░░██╔══██╗██║████╗░██║██╔════╝                                                             #
# ███████║██║░░░░░██████╔╝██║██╔██╗██║█████╗░░                                                             #
# ██╔══██║██║░░░░░██╔═══╝░██║██║╚████║██╔══╝░░                                                             #
# ██║░░██║███████╗██║░░░░░██║██║░╚███║███████╗                                                             #
# ╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚═╝░░╚══╝╚══════╝                                                 Realm Chua  #
############################################################################################################

########## System Setting
FROM alpine:3.16.1

VOLUME ["/sys/fs/cgroup"]
VOLUME ["/config", "/work", "/logs"]

ENV container=docker
ENV TIMEZONE="Asia/Singapore"
ARG VERSION
ARG BUILD_DATE

RUN echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/main' >>/etc/apk/repositories

########## Maintainer Information
LABEL cloud.mylinuxbox.vendor="Realm Chua" \
      cloud.mylinuxbox.version=$VERSION \
      cloud.mylinuxbox.build-date=$BUILD_DATE

########## Dockerfile

RUN apk add --no-cache su-exec \
    ca-certificates \
    bash \
    bash-doc \
    bash-completion \
    rsyslog \
    rsyslog-elasticsearch \
    rsyslog-mmjsonparse \
    rsyslog-mmutf8fix \
    rsyslog-omrelp \
    nano \
    git \
    wget \
    curl \
    bc \
    socat \
    netcat-openbsd \
    udev \
    openrc \
    tzdata && \
    rm -rf /var/cache/apk/* \
        /etc/init.d/hwdrivers \
        /etc/init.d/hwclock \
        /etc/init.d/hwdrivers \
        /etc/init.d/modules \
        /etc/init.d/modules-load \
        /etc/init.d/modloop && \
    adduser -s /bin/ash -D rsyslog rsyslog && \
    echo "rsyslog ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

COPY ["config/rsyslog.conf", "config/rsyslog.conf.d/", "config/motd", "/etc/"]
COPY ["config/motd.sh", "/etc/profile.d/"]

RUN echo "${TIMEZONE}" >/etc/timezone && \
    mkdir -p /lib/rc/init.d && \
    ln -s /lib/rc/init.d /run/openrc && \
    touch /run/openrc/softlevel && \
    rc-status && \
    sed -i 's/^\(tty\d\:\:\)/#\1/g' /etc/inittab && \
    sed -i -e 's/#rc_sys=".*"/rc_sys="docker"/g' \
        -e 's/#rc_env_allow=".*"/rc_env_allow="\*"/g' \
        -e 's/#rc_crashed_stop=.*/rc_crashed_stop=NO/g' \
        -e 's/#rc_crashed_start=.*/rc_crashed_start=YES/g' \
        -e 's/#rc_provide=".*"/rc_provide="loopback net"/g' \
        /etc/rc.conf && \
    sed -i 's/cgroup_add_service /# cgroup_add_service /g' /lib/rc/sh/openrc-run.sh && \
    sed -i 's/VSERVER/DOCKER/Ig' /lib/rc/sh/init.sh


STOPSIGNAL SIGTERM

CMD ["bash"]
