FROM ubuntu:trusty

ENV VERSION 3.3.2
ENV RELEASE 1

RUN apt-get update && apt-get -y install build-essential git
RUN mkdir /work && chown daemon:daemon /work

WORKDIR /work
USER daemon
RUN git clone git://cmake.org/cmake.git .
RUN git checkout v$VERSION
RUN ./configure
RUN make -j 8

USER root
RUN apt-get -y install checkinstall
RUN checkinstall \
	-D -y \
	--pkgname=cmake \
	--pkgversion=$VERSION \
	--pkgrelease=$RELEASE

CMD true
