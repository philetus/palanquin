FROM docker.io/library/ubuntu:focal-20210713 as base

FROM base as build

# dont ask to setup timezone
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update
RUN apt-get install -y \
  binutils-arm-none-eabi \
  curl \
  gcc-arm-none-eabi \
  gdb-multiarch \
  git \
  nano \
  openocd \
  tmux

# get nodate tool
ENV NODATE_HOME=/nodate
RUN git clone https://github.com/MayaPosch/Nodate.git $NODATE_HOME

# set up build dir as working dir
ENV BUILD_DIR=/build
RUN mkdir -p $BUILD_DIR
WORKDIR $BUILD_DIR

COPY . .

CMD ["tail", "-f", "/dev/null"]
