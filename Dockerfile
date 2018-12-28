FROM oraclelinux:7

RUN echo $'[pritunl]\n\
name=Pritunl Repository\n\
baseurl=https://repo.pritunl.com/stable/yum/oraclelinux/7/\n\
gpgcheck=1\n\
enabled=1' > /etc/yum.repos.d/pritunl.repo

RUN gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A
RUN gpg --armor --export 7568D9BB55FF9E5287D586017AE645C0CF8E292A > key.tmp
RUN rpm --import key.tmp
RUN rm -f key.tmp

RUN yum update -y
RUN yum install -y pritunl-zero-1.0.1130.30

ENTRYPOINT ["/usr/bin/pritunl-zero"]
CMD ["start"]
