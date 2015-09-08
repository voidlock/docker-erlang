FROM buildpack-deps:jessie
MAINTAINER Alex Arnell <alex.arnell@cgmail.com>

ENV ERLANG_VERSION R16B03-1
ENV REBAR_VERSION 2.5.1
ENV RELX_VERSION v1.0.4

ENV ERLANG_VERSION=OTP_R16B03-1 \
    REBAR_VERSION=2.5.1 \
    RELX_VERSION=v1.0.4 \
    LANG=C

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

RUN cd /usr/src \
    && curl -L -o rebar-${REBAR_VERSION}.tar.gz "https://github.com/rebar/rebar/archive/${REBAR_VERSION}.tar.gz" \
    && tar zxf rebar-${REBAR_VERSION}.tar.gz \
    && cd rebar-${REBAR_VERSION} \
    && make \
    && cp rebar /usr/local/bin/rebar \
    && cd .. \
    && rm -rf rebar-${REBAR_VERSION} rebar-${REBAR_VERSION}.tar.gz

RUN cd /usr/src \
    && curl -L -o relx-${RELX_VERSION}.tar.gz "https://github.com/erlware/relx/archive/${RELX_VERSION}.tar.gz" \
    && mkdir relx-${RELX_VERSION} \
    && tar zxf relx-${RELX_VERSION}.tar.gz -C relx-${RELX_VERSION} --strip-components=1 \
    && cd relx-${RELX_VERSION} \
    && make \
    && cp relx /usr/local/bin/relx \
    && cd .. \
    && rm -rf relx-${RELX_VERSION} relx-${RELX_VERSION}.tar.gz

CMD ["erl"]
