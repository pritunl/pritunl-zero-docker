# pritunl-zero-docker

[![github](https://img.shields.io/badge/github-pritunl-11bdc2.svg?style=flat)](https://github.com/pritunl)
[![twitter](https://img.shields.io/badge/twitter-pritunl-55acee.svg?style=flat)](https://twitter.com/pritunl)

[Pritunl-Zero](https://zero.pritunl.com) is a zero trust system
that provides secure authenticated access to internal services from untrusted
networks without the use of a VPN. Documentation and more
information can be found at
[docs.pritunl.com](https://docs.pritunl.com/docs/pritunl-zero)

# Usage

To use this container the `MONGO_URI` and `NODE_ID` must be set. The node ID
is used to identify the node in the cluster, it must be unique to each
running container.

```bash
docker run --rm \
	--name pritunl-zero \
	-p 80:80 \
	-p 443:443 \
	-e MONGO_URI="mongodb://mongo.example.domain:27017/pritunl-zero" \
	-e NODE_ID="5b8e11e4610f990034635e98" \
	iad.ocir.io/pritunl8472/pritunl-zero
```
