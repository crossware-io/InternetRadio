# SDK container as base
ARG CROSS_TC_IMAGE_ARCH=arm64
ARG TOOLCHAIN_ARCH=arm64
ARG CROSS_TC_DOCKER_REGISTRY=torizon
ARG BASE_NAME=debian
ARG IMAGE_ARCH=linux/arm/v8
ARG IMAGE_TAG=2-bullseye
ARG DOCKER_REGISTRY=torizon

FROM $CROSS_TC_DOCKER_REGISTRY/debian-cross-toolchain-$CROSS_TC_IMAGE_ARCH:$IMAGE_TAG AS build

RUN dpkg --add-architecture arm64 \ 
    && apt-get update && apt-get install -y \
    git   \
    cmake \
    unzip \
    clang \ 
    pkg-config \
    libcurl4-openssl-dev:arm64 \
    libboost-system-dev:arm64 \
    libjsoncpp-dev:arm64 \
    libxkbcommon-dev:arm64 \
    libwayland-dev:arm64 \
    libwayland-egl1:arm64  \
    libegl-dev:arm64 \
    libegl1-mesa:arm64 \
    libgles2-mesa:arm64 \
    && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/aarch64-linux-gnu/usr && mkdir -p /usr/aarch64-linux-gnu/usr/aarch64-linux-gnu
RUN ln -sf /usr/aarch64-linux-gnu/lib                         /usr/aarch64-linux-gnu/usr/aarch64-linux-gnu/lib
RUN cp /usr/lib/aarch64-linux-gnu/libxkbcommon.so.0.0.0       /usr/aarch64-linux-gnu/lib/libxkbcommon.so.0
RUN cp /usr/lib/aarch64-linux-gnu/libwayland-client.so.0.3.0  /usr/aarch64-linux-gnu/lib/libwayland-client.so.0
RUN cp /usr/lib/aarch64-linux-gnu/libwayland-cursor.so.0.0.0  /usr/aarch64-linux-gnu/lib/libwayland-cursor.so.0
RUN cp /usr/lib/aarch64-linux-gnu/libwayland-egl.so.1.0.0     /usr/aarch64-linux-gnu/lib/libwayland-egl.so.1
RUN cp /usr/lib/aarch64-linux-gnu/libffi.so.7.1.0             /usr/aarch64-linux-gnu/lib/libffi.so.7
RUN cp /usr/lib/aarch64-linux-gnu/libEGL.so.1.1.0             /usr/aarch64-linux-gnu/lib/libEGL.so.1
RUN cp /usr/lib/aarch64-linux-gnu/libGLdispatch.so.0.0.0      /usr/aarch64-linux-gnu/lib/libGLdispatch.so.0

RUN git clone   https://github.com/sony/flutter-elinux.git
RUN mv flutter-elinux /opt/
ENV PATH="/opt/flutter-elinux/bin:${PATH}"

RUN flutter-elinux doctor -v

WORKDIR /InternetRadio
CMD flutter-elinux pub get && flutter-elinux build elinux --target-arch=arm64 \
                                --target-sysroot=/usr/aarch64-linux-gnu \
                                --system-include-directories=/usr/aarch64-linux-gnu/include/c++/10/aarch64-linux-gnu \
                                --debug
