FROM buildpack-deps:jessie-scm
MAINTAINER Alex Arnell <alex.arnell@cgmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    locales \
    build-essential \
    autoconf \
    libssl-dev \
    libncurses-dev \
    && export LANG=en_US.UTF-8 \
    && echo $LANG UTF-8 > /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=$LANG

ENV ERLANG_VERSION=OTP_R16B03-1 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

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
