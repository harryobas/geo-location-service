import Config

config :geo_location_service_core, GeoLocationServiceCore.Repo,
     database: "../../database_test.db"

config :geo_location_service_core,
     raw_data_file: "../../raw_data_test.csv"
