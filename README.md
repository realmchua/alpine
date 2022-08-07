An 𝓐𝓵𝓹𝓲𝓷𝓮 𝓛𝓲𝓷𝓾𝔁 Image prebuilds with Bash and Gentoo's OpenRC system init service.

Build and maintained by: Realm Chua < realm at mylinuxbox dot cloud>

https://github.com/realmchua/alpine

https://hub.docker.com/repository/docker/realmsg/alpine/

𝗪𝗵𝗮𝘁 𝗶𝘀 𝗔𝗹𝗽𝗶𝗻𝗲 𝗟𝗶𝗻𝘂𝘅❓

Alpine Linux is a Linux distribution built around musl libc and BusyBox.
The Alpine base image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images.
This makes Alpine Linux a great image base for utilities and even production applications.

𝗛𝗼𝘄 𝘁𝗼 𝗯𝘂𝗶𝗹𝗱 𝗳𝗿𝗼𝗺 𝘁𝗵𝗲 𝗗𝗼𝗰𝗸𝗲𝗿𝗳𝗶𝗹𝗲❓

wget https://github.com/realmchua/alpine.git

cd alpine

./build.sh (To build the image from the Dockerfile)

𝗛𝗼𝘄 𝘁𝗼 𝘂𝘀𝗲 𝗺𝘆 𝗶𝗺𝗮𝗴𝗲❓

./deploy (To deploy the image file) or

docker run -it \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  realmsg/alpine:latest
  
  ./push (To push the image to Docker Hub's Repository)
  
D̳i̳s̳c̳l̳a̳i̳m̳e̳r̳: please visit https://pkgs.alpinelinux.org/ to view the license information for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under additional licenses (such as bash, etc., from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
