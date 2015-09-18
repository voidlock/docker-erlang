FROM buildpack-deps:jessie-scm
MAINTAINER Alex Arnell <alex.arnell@cgmail.com>

ENV ERLANG_VERSION=OTP-18.0.3 \
    LANG=C

RUN apt-get update && apt-get install -y \
      build-essential \
      autoconf \
      libssl-dev \
      libncurses-dev

RUN cd /usr/src \
    && curl -L -o ${ERLANG_VERSION}.tar.gz "https://github.com/erlang/otp/archive/${ERLANG_VERSION}.tar.gz" \
    && tar xf ${ERLANG_VERSION}.tar.gz \
    && cd otp-${ERLANG_VERSION} \
    && ./otp_build autoconf \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf otp-${ERLANG_VERSION} ${ERLANG_VERSION}.tar.gz

CMD ["erl"]
