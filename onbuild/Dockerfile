FROM voidlock/erlang:R16B02

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY . /usr/src/app
ONBUILD RUN rebar -C public.rebar.config get-deps compile
