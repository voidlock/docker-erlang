FROM heroku/cedar:14
MAINTAINER Alex Arnell <alex.arnell@cgmail.com>

ENV ERLANG_VERSION R16B02
ENV REBAR_VERSION 2.5.1
ENV RELX_VERSION v1.0.4

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && \
    apt-get install -y \
    libncurses5-dev \
    openssl \
    libssl-dev \
    fop \
    xsltproc \
    unixodbc-dev \
    automake \
    build-essential \
    curl \
    wget \
    git

RUN cd /usr/src \
    && curl -L -o otp_src_${ERLANG_VERSION}.tar.gz "http://erlang.org/download/otp_src_${ERLANG_VERSION}.tar.gz" \
    && tar xf otp_src_${ERLANG_VERSION}.tar.gz \
    && cd otp_src_${ERLANG_VERSION} \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf otp_src_${ERLANG_VERSION} otp_src_${ERLANG_VERSION}.tar.gz

RUN cd /usr/src \
    && curl -L -o rebar-${REBAR_VERSION}.tar.gz "https://github.com/rebar/rebar/archive/${REBAR_VERSION}.tar.gz" \
    && tar zxf rebar-${REBAR_VERSION}.tar.gz \
    && cd rebar-${REBAR_VERSION} \
    && make \
    && cp rebar /usr/bin/rebar \
    && cd .. \
    && rm -rf rebar-${REBAR_VERSION} rebar-${REBAR_VERSION}.tar.gz

RUN cd /usr/src \
    && curl -L -o relx-${RELX_VERSION}.tar.gz "https://github.com/erlware/relx/archive/${RELX_VERSION}.tar.gz" \
    && mkdir relx-${RELX_VERSION} \
    && tar zxf relx-${RELX_VERSION}.tar.gz -C relx-${RELX_VERSION} --strip-components=1 \
    && cd relx-${RELX_VERSION} \
    && make \
    && cp relx /usr/bin/relx \
    && cd .. \
    && rm -rf relx-${RELX_VERSION} relx-${RELX_VERSION}.tar.gz

CMD ["erl"]
