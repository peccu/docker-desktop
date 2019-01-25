FROM kunst1080/desktop:i3
# based from https://github.com/kunst1080/docker-desktop

# user
ARG user=user
ARG passwd=user
ARG uid=1000
RUN groupadd -g 999 docker
RUN useradd ${user} -u $uid -p $passwd -m -G adm,dialout,cdrom,sudo,audio,dip,video,plugdev,netdev,docker -s /bin/bash

# install barrier
RUN apt-get update && \
  apt-get install -y libavahi-compat-libdnssd1
# install openssl 1.1.1a for barrier
RUN mkdir /home/$user/download && \
  cd /home/$user/download && \
  curl -LO https://www.openssl.org/source/openssl-1.1.1a.tar.gz && \
  tar xf openssl-1.1.1a.tar.gz && \
  cd openssl-1.1.1a && \
  ./config && \
  make && \
  make install && \
  cd .. && \
  rm -rf openssl-1.1.1a openssl-1.1.1a.tar.gz && \
  ldconfig
# instal barrier
RUN cd /home/$user/download && \
  curl -LO https://github.com/debauchee/barrier/releases/download/v2.1.0/barrier-2.1.0-linux.tar.bz2 && \
  tar xf barrier-2.1.0-linux.tar.bz2 && \
  mv barrier-2.1.0-Linux/bin/* /usr/local/bin/ && \
  rm -rf barrier-2.1.0-Linux barrier-2.1.0-linux.tar.bz2
RUN rmdir /home/$user/download

# install Docker-CE
RUN apt-get update && \
  apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
  apt-get update && \
  apt-get install -y docker-ce

RUN curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose

USER $user
WORKDIR /home/$user
RUN mkdir -p .config/i3
RUN ln -s /xinitrc .xinitrc
