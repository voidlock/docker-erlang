FROM voidlock/erlang:latest

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY rebar.config /usr/src/app/
ONBUILD RUN rebar get-deps
ONBUILD COPY . /usr/src/app

ONBUILD RUN rebar compile
