# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Configure Mix tasks and generators
config :geo_location_service_app,
  ecto_repos: [GeoLocationServiceApp.Repo]

config :geo_location_service_api,
  #ecto_repos: [GeoLocationServiceApi.Repo],
  generators: [context_app: false]

# Configures the endpoint
config :geo_location_service_api, GeoLocationServiceApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lPOA9PeUa/JoZycvI3VQPCbxDbvRk8rSzYrLULKgHTzbKv5zGFpJD0w9ox5ueZBl",
  render_errors: [view: GeoLocationServiceApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: GeoLocationServiceApi.PubSub, adapter: Phoenix.PubSub.PG2]


config :phoenix, :json_library, Jason



import_config "#{config_env()}.exs"
