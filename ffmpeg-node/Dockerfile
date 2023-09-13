ARG NODE_VERSION
FROM node:${NODE_VERSION}


RUN apt-get update -qq
#RUN apt-get install -y build-essential
RUN apt-get -y install \
      autoconf \
      automake \
      build-essential \
      cmake \
      git-core \
      libass-dev \
      libfreetype6-dev \
      libgnutls28-dev \
      libmp3lame-dev \
      libsdl2-dev \
      libtool \
      libva-dev \
      libvdpau-dev \
      libvorbis-dev \
      libxcb1-dev \
      libxcb-shm0-dev \
      libxcb-xfixes0-dev \
      meson \
      ninja-build \
      pkg-config \
      texinfo \
      wget \
      yasm \
      zlib1g-dev

RUN apt install libunistring-dev libaom-dev libdav1d-dev

RUN apt-get install -y nasm libx264-dev libx265-dev libnuma-dev libvpx-dev libopus-dev libdav1d-dev

WORKDIR /etc

ARG FFMPEG_VERSION
RUN git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg -b release/${FFMPEG_VERSION} && rm -rf ./ffmpeg/.git

WORKDIR /etc/ffmpeg

RUN ./configure \
  --pkg-config-flags="--static" \
  --extra-libs="-lpthread -lm" \
  --ld="g++" \
  --bindir="/bin" \
  --enable-gpl \
  --enable-gnutls \
  --enable-libass \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libdav1d \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree
#  --enable-libaom \
#  --enable-libsvtav1 \
#  --enable-libfdk-aac \

RUN make
RUN make install