FROM debian:latest

RUN apt update && apt upgrade && apt install sudo vim nano man gosu -y
RUN apt clean -y
RUN useradd -m ginkana
RUN echo 'ginkana:piraten_bizitza_oberena_da' | chpasswd
RUN chsh -s /bin/bash ginkana
COPY ginkana/ /home/ginkana/
COPY root/ /root/
