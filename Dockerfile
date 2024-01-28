FROM erdonline/jdk8-yum-go:latest

MAINTAINER martin114@foxmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /martin-biz-resource

WORKDIR /martin-biz-resource

EXPOSE 9401

ADD ./martin-biz/martin-biz-resource/target/martin-biz-resource.xjar ./

ADD ./martin-biz/martin-biz-resource/target/xjar.go ./

RUN go version

RUN go build xjar.go

ENTRYPOINT ./xjar java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar martin-biz-resource.xjar
