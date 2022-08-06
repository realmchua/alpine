############################################
#  ██████╗░░█████╗░  ███╗░░██╗██╗██╗░░██╗  #
#  ██╔══██╗██╔══██╗  ████╗░██║██║╚██╗██╔╝  #
#  ██████╔╝██║░░╚═╝  ██╔██╗██║██║░╚███╔╝░  #
#  ██╔══██╗██║░░██╗  ██║╚████║██║░██╔██╗░  #
#  ██║░░██║╚█████╔╝  ██║░╚███║██║██╔╝╚██╗  #
#  ╚═╝░░╚═╝░╚════╝░  ╚═╝░░╚══╝╚═╝╚═╝░░╚═╝  #
############################################

An Alpine Linux Image prebuilds with Bash and Gentoo's OpenRC system init service. (40.3 MB)

Build and maintained by: Realm Chua < realm at mylinuxbox dot cloud>

https://github.com/realmchua/rc-alpine-nginx/
https://hub.docker.com/repository/docker/realmsg/rc-alpine-nginx/

What is Alpine Linux?

Alpine Linux is a Linux distribution built around musl libc and BusyBox.
The Alpine base image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images.
This makes Alpine Linux a great image base for utilities and even production applications.

How to use my image?

docker run -it \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  realmsg/rc-alpine
  
Disclaimer: please visit https://pkgs.alpinelinux.org/ to view the license information for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under additional licenses (such as bash, etc., from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
