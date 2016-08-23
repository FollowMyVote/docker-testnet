FROM base/archlinux
MAINTAINER Nathan Hourt <nathan@followmyvote.com>

ADD packages.sh /
RUN /packages.sh

RUN useradd -d /var/fmv -s /bin/false -rmN fmv
WORKDIR /var/fmv

ADD aur.sh .
RUN ./aur.sh

USER fmv

ADD build.sh .
RUN ./build.sh

ADD skeleton.tar /var/
EXPOSE 8080 8090 9001 17073 37073
VOLUME /var/fmv/backend_data /var/fmv/witness_data /var/fmv/supervisor
ENTRYPOINT ["supervisord", "-c", "/var/fmv/supervisor/supervisord.conf"]
