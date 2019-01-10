# docker desktop with Barrier client
base image is [kunst1080/docker-desktop](https://github.com/kunst1080/docker-desktop).

## Install
- build container with specified password for user
```
$ git clone https://github.com/peccu/docker-desktop
$ cd docker-desktop
$ ./build.sh
make password for X container
Password:
Verifying - Password:
```

- setup Barrier configuration
```
$ cp .env.example .env
$ cat .env
BARRIER_CLIENT_NAME=docker-desktop
BARRIER_SERVER_HOST=192.168.0.5
$ # edit .env
```

- setup your Barrier server
  - Barrier client name is setup above.

## Launch desktop
```
$ docker-compose up -d
```

## References
- [kunst1080/docker-desktop: My GUI environment on Docker.](https://github.com/kunst1080/docker-desktop)
  - [Running X server via Docker · kunst1080](https://blog.kunst1080.net/2018/03/06/running-x-server-via-docker/)
  - [DockerでXサーバを動かしてGUIを直接表示する - くんすとの備忘録](https://kunst1080.hatenablog.com/entry/2018/03/18/225102)
- [debauchee/barrier: Open-source KVM software](https://github.com/debauchee/barrier)
