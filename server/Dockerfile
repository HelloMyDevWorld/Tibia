FROM ubuntu:14.04 AS build
RUN apt-get update -y && apt-get install -y \
  git \
  cmake \
  build-essential \
  liblua5.2-dev \
  libgmp3-dev \
  libmysqlclient-dev \
  libboost-system-dev \
  libboost-iostreams-dev \
  libpugixml-dev

COPY cmake /usr/src/forgottenserver/cmake/
COPY src /usr/src/forgottenserver/src/
COPY CMakeLists.txt /usr/src/forgottenserver/
WORKDIR /usr/src/forgottenserver/build
RUN cmake .. && make

COPY wait-for.sh /
RUN chmod +x /wait-for.sh

RUN cp /usr/src/forgottenserver/build/tfs /bin/tfs

EXPOSE 7171 7172

WORKDIR /srv
VOLUME [ "/srv" ]

ENTRYPOINT [ "/wait-for.sh", "database:3306", "-t", "45", "--" ]

CMD [ "/bin/tfs" ]