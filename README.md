# Docker-Nagios
Dockerized nagios with JMX4Perl. Extends on jasonrivers/nagios docker image.

### Configurations
Nagios Configuration lives in /opt/nagios/etc
NagiosGraph configuration lives in /opt/nagiosgraph/etc
JMX4Perl base configuration lives in /etc/jmx4perl/config

### Install

```sh
docker pull mikakoivisto/nagios:latest
```

### Running

Run with the example configuration with the following:

```sh
docker run --name nagios4 -p 0.0.0.0:8080:80 mikakoivisto/nagios:latest
```

alternatively you can use external Nagios configuration & log data with the following:

```sh
docker run --name nagios4  \
  -v /path-to-nagios/etc/:/opt/nagios/etc/ \
  -v /path-to-jmx4perl-config/jmx4perl.cfg:/etc/jmx4perl/jmx4perl.cfg \
  -p 0.0.0.0:8080:80 mikakoivisto/nagios:latest
```

Example jmx4perl.cfg

```
# Default definitions
include config/common.cfg
include config/memory.cfg
include config/tomcat.cfg
include config/threads.cfg

<Server localhost>
  Url http://localhost:8080/jolokia
  User <USERNAME>
  Password <PASSWORD>
</Server>
```

#### Credentials

The default credentials for the web interface is `nagiosadmin` / `nagios`