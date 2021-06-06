import Config

config :geo_location_service_core, GeoLocationServiceCore.Repo,
database: "../../database.db"

config :geo_location_service_core,
data_file: "../../data_dump.csv"
