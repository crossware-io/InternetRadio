# Crossware Flutter Internet Radio Demo Application 
This package contains Radio Application source and Docker files to build and create docker images which run on TorizonCore
- flutter_new_internetradio (Internet Radio application soruce)
- Flutter_torizon (Contains Docker file and yaml script)
- Dockerfile  (to create build env image for crosscompilation)
 
# STEP-1 Cross compile Flutter application 
Prepare Host machine with all prerequisites and Create application bundle

Create the Docker image  with Flutter build environment
```
$ docker build  --no-cache -t  flutter_build_env:1 .
```

Run the image by providing flutterapplication absolute path 
```
$docker run --rm -v <path>/flutter_new_internetradio:/InternetRadio flutter_build_env:1
```

```
Copy bundle folder to Flutter_torizon folder available under "flutter_new_internetradio/build/elinux/arm64/debug/bundle" 
```
$ cp -r flutter_new_internetradio/build/elinux/arm64/debug/bundle   Flutter_torizon/ 
``` 
# STEP-2 Create Docker image 
```
$ cd Flutter_torizon
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
                               
