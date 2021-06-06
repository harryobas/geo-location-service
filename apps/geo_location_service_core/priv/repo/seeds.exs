
alias GeoLocationServiceCore.Import.CSVImport

data_file = Application.get_env(:geo_location_service_core, :data_file)

data_file |> CSVImport.import_geo_location_data()
