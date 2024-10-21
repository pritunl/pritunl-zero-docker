FROM oraclelinux:9

RUN yum update -y

RUN echo $'[pritunl]\n\
name=Pritunl Repository\n\
baseurl=https://repo.pritunl.com/stable/yum/oraclelinux/9/\n\
gpgcheck=1\n\
enabled=1\n\
gpgkey=https://raw.githubusercontent.com/pritunl/pgp/master/pritunl_repo_pub.asc' > /etc/yum.repos.d/pritunl.repo

RUN dnf install -y pritunl-zero

ENTRYPOINT ["/usr/bin/pritunl-zero"]
CMD ["start"]
