# Crossware Flutter Internet Raio Demo Application 
This package contains Radio Application source and Docker file to create docker images to tun on TorizonCore
- flutter_new_internetradio 
  Internet Radio application soruce 
- FLutter_torizon
  Contains Docker file and yaml script 
 
# STEP-1 Cross compile Fluter application 
Prepare Host machien with all prerequisites and Create application bunble 
```
$ cd flutter_new_internetradio  
$ flutter-elinux build elinux --target-arch=arm64  \
        --target-sysroot=/opt/tdx-wayland/5.x.y/sysroots/aarch64-tdx-linux  \
        --system-include-directories=/usr/aarch64-linux-gnu/include/c++/9/aarch64-linux-gnu \
        --debug
```
Copy bundle folder 
Copy bundle folder to Fluter_torizon folder where Docker file exists
```
$ cp -r flutter_new_internetradio/build/elinux/arm64/debug/bundle   Flutter_torizon/ 
``` 
# STEP-2 Create Docker image 
```
$ cd Flutter_radio 
$ ls 
bundle docker_compose_flutter.yaml  Dockerfile
$ docker build  --no-cache -t  flutter_test:radio  .
$ docker save  flutter_test:radio > ./flutter_test_radio.tar
$ scp flutter_test_radio.tar torizon@<ip-add>:/home/torizon/
$ scp docker_compose_flutter torizon@<ip-add>:/home/torizon/
```
# STEP-3 Run Image on Target 
```
# verdin-imx8mp-1234:~$ ls
docker_compose_flutter.yaml  flutter_test_radio.tar
# target# docker load <  image-any-name.tar
# docker stop $(docker ps -a -q)
# docker-compose -f docker_compose_flutter.yaml up
```