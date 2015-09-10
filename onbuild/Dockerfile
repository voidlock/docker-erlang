FROM voidlock/erlang:17.5

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY . /usr/src/app

ONBUILD RUN rebar3 update && rebar3 release
