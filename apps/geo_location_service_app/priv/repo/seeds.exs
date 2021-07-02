# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GeoLocationServiceApp.Repo.insert!(%GeoLocationServiceApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GeoLocationServiceApp.Import.CSVImport

data_file = Application.get_env(:geo_location_service_app, :data_file)

data_file |> CSVImport.import_geo_location_data()
