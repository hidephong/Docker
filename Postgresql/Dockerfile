FROM centos
MAINTAINER techmaster.vn
RUN rpm --import http://yum.postgresql.org/RPM-GPG-KEY-PGDG-94
RUN rpm -Uivh http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm
RUN yum update –y
RUN yum -y -q install postgresql94 postgresql94-server postgresql94-contrib
RUN su - postgres -c /usr/pgsql-9.4/bin/initdb
USER postgres
RUN echo "host all  all    0.0.0.0/0  trust" >> /var/lib/pgsql/9.4/data/pg_hba.conf
RUN echo "listen_addresses='*'" >> /var/lib/pgsql/9.4/data/postgresql.conf
EXPOSE 5432
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql","/tmp/","/var/lib/pgsql"]
CMD ["/usr/pgsql-9.4/bin/pg_ctl", "-D", "/var/lib/pgsql/9.4/data","start"]
RUN /usr/pgsql-9.4/bin/pg_ctl -D /var/lib/pgsql/9.4/data start