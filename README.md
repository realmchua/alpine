An ððĩðđðēð·ðŪ ððēð·ðūð Image prebuilds with Bash and Gentoo's OpenRC system init service.

Build and maintained by: Realm Chua < realm at mylinuxbox dot cloud>

https://github.com/realmchua/

https://hub.docker.com/repository/docker/realmsg/

https://mylinuxbox.cloud

ðŠðĩðŪð ðķð ððđð―ðķðŧðē ððķðŧððâ

Alpine Linux is a Linux distribution built around musl libc and BusyBox.
The Alpine base image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images.
This makes Alpine Linux a great image base for utilities and even production applications.

ððžð ððž ðŊððķðđðą ðģðŋðžðš ððĩðē ððžð°ðļðēðŋðģðķðđðēâ

wget https://github.com/realmchua/alpine.git

cd alpine

./build.sh (To build the image from the Dockerfile)

ððžð ððž ðððē ðšð ðķðšðŪðīðēâ

./deploy (To deploy the image file) or

docker run -it \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  realmsg/alpine:stable
  
  ./push (To push the image to Docker Hub's Repository)
  
DĖģiĖģsĖģcĖģlĖģaĖģiĖģmĖģeĖģrĖģ: please visit https://pkgs.alpinelinux.org/ to view the license information for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under additional licenses (such as bash, etc., from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
