FROM jasonrivers/nagios:4.4.3
MAINTAINER Mika Koivisto <mika@jguru.fi>

RUN apt-get update && apt-get install -y        \
        libsys-sigaction-perl                   \
        libxml-libxml-perl                      \
        libterm-shellui-perl                    \
        libterm-progressbar-perl                \
        libarchive-zip-perl                     \
        libio-socket-multicast-perl             \
        libmodule-find-perl                     \
        libterm-readkey-perl                    \
        libconfig-general-perl                  \
        libterm-size-perl                       \
        libxml-twig-perl                        \
        libdigest-sha-perl                      \
        libjson-perl                            \
        libterm-readline-perl-perl              \
        libcrypt-blowfish-perl                  \
        libterm-clui-perl                       \
                                                && \
        apt-get clean && rm -Rf /var/lib/apt/lists/*

RUN curl -L https://cpanmin.us | perl - App::cpanminus && \
        cpanm install JMX::Jmx4Perl

RUN mkdir -p /etc/jmx4perl && cp -av $(dirname $(find /root/.cpanm -type f -name jetty.cfg | grep jmx4perl |head -1)) /etc/jmx4perl/

RUN rm -Rf /root/.cpanm/

