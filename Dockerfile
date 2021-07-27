FROM elixir:1.11.4

RUN mix local.hex --force \
  && mix archive.install --force hex phx_new 1.5.9 \
  && apt-get update \
  && apt-get install -y apt-utils \
  && apt-get install -y build-essential \
  && apt-get install -y inotify-tools \
  && mix local.rebar --force

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 4000

COPY apps/geo_location_service_api/mix.exs apps/geo_location_service_api/
COPY apps/geo_location_service_app/mix.exs apps/geo_location_service_app/


COPY mix.exs mix.lock ./

COPY . ${APP_HOME}

RUN mix do deps.get, deps.compile --skip-umbrella-children

CMD ["mix", "phx.server"]

