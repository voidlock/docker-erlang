FROM buildpack-deps:jessie
MAINTAINER Alex Arnell <alex.arnell@cgmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    && export LANG=en_US.UTF-8 \
    && echo $LANG UTF-8 > /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=$LANG \
    && rm -rf /var/lib/apt/lists/*

ENV OTP_VERSION=OTP-19.3.2 \
    OTP_DOWNLOAD_SHA=2d58b672fce9780ea9b5cd8929a978eaa79730e65bf3d11fc814e2f759ffbd04 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

RUN set -xe \
    && curl -SL https://github.com/erlang/otp/archive/$OTP_VERSION.tar.gz -o otp-src.tar.gz \
    && echo "$OTP_DOWNLOAD_SHA otp-src.tar.gz" | sha256sum -c - \
    && mkdir -p /usr/src/otp-src \
    && tar -xzC /usr/src/otp-src --strip-components=1 -f otp-src.tar.gz \
    && rm otp-src.tar.gz \
    && cd /usr/src/otp-src \
    && ./otp_build autoconf \
    && ./configure \
    && make -j$(nproc) \
    && make install \
    && rm -rf /usr/src/otp-src

CMD ["erl"]
