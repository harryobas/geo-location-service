import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :geo_location_service_api, GeoLocationServiceApi.Endpoint,
  http: [port: 4002],
  server: false

config :geo_location_service_app, GeoLocationServiceApp.Repo,
     username: System.get_env("DATAASE_USER"),
     password: System.get_env("DATABASE_PASSWORD"),
     database: "geo_location_service_test",
     hostname: System.get_env("DATABASE_HOST"),
     #port: System.get_env("DB_PORT"),
     pool: Ecto.Adapters.SQL.Sandbox


config :geo_location_service_app,
     raw_data_file: "../../raw_data_test.csv"
