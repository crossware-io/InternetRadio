#ARG BASE_NAME=wayland-base-vivante 
ARG BASE_NAME=weston-vivante 
ARG IMAGE_ARCH=linux/arm64/v8
ARG IMAGE_TAG=2
ARG DOCKER_REGISTRY=torizon

FROM --platform=$IMAGE_ARCH $DOCKER_REGISTRY/$BASE_NAME:$IMAGE_TAG
ARG IMAGE_ARCH
RUN mkdir -p /app/radio 


RUN apt-get -y update && apt-get install -y \
	alsa-utils  \
	psmisc \
        libgstreamer1.0-0 \
        gstreamer1.0-plugins-base \
        gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-bad \
        gstreamer1.0-plugins-ugly \
        gstreamer1.0-libav \
        gstreamer1.0-doc \
        gstreamer1.0-tools \
        gstreamer1.0-x \
        gstreamer1.0-alsa \
        gstreamer1.0-gl \
        gstreamer1.0-gtk3 \
        gstreamer1.0-pulseaudio 

ADD bundle /app/radio/ 
	
WORKDIR /app/radio/
ENV PATH="/app/radio:${PATH}"

ENV VIV_PROFILE="1"

ENTRYPOINT ["flutter_new_internetradio"]
CMD [ "-f", "-b",  "/app/radio"] 
