# Use the Ubuntu 24.04 base image
FROM ubuntu:24.04

## Update and enable sudo
RUN apt-get update \
 && apt-get install -y adduser sudo
RUN sudo apt-get install -y git build-essential

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
RUN sudo apt-get update 

# install dependencies for komorebi
RUN sudo apt install -y cmake valac libgtk-3-dev libgee-0.8-dev libclutter-gtk-1.0-dev libclutter-1.0-dev libwebkit2gtk-4.1-dev libunwind-dev libclutter-gst-3.0-dev