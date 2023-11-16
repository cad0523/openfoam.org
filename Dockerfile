FROM ubuntu:22.04

LABEL maintainer="t_kado <t_kado@hotmail.com>"


# 
RUN apt update \
 && apt install -y \
    git \
    curl \
    gnupg \
    wget \
    software-properties-common \
 && apt autoremove -y \
 && apt clean \
 && apt autoclean \
 && rm -rf /var/lib/apt/lists/* /root/.[acpw]*


# OpenFOAM
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN sh -c "wget -O - https://dl.openfoam.org/gpg.key | apt-key add -" \
 && add-apt-repository http://dl.openfoam.org/ubuntu \
 && apt update \
 && apt install -y \
    openfoam11 \
    paraview \
 && apt autoremove -y \
 && apt clean \
 && apt autoclean \
 && rm -rf /var/lib/apt/lists/* /root/.[acpw]*

WORKDIR "/home"
