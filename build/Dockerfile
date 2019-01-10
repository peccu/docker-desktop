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

USER $user
WORKDIR /home/$user
RUN mkdir -p .config/i3
RUN ln -s /xinitrc .xinitrc
