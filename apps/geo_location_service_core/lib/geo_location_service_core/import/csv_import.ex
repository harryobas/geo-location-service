defmodule GeoLocationServiceCore.Import.CSVImport do
  alias GeoLocationServiceCore.Storage.Location
  alias NimbleCSV.RFC4180, as: CSV
  alias GeoLocationServiceCore.Repo

  import GeoLocationServiceCore.Import.DataSanitizer

  def import_geo_location_data(csv_file) do
      csv_file
      |> File.stream!(read_ahead: 500)
      |> CSV.parse_stream()
      |> Stream.filter(fn [ip, country_code, country, city, lon, lat, mystery_val] ->
        sanitize(ip, country_code, country, city, lon, lat, mystery_val)
      end)
      |> Stream.map(fn [ip, country_code, country, city, lon, lat, mystery_val]->
        %{
          ip_address: :binary.copy(ip),
          country_code: :binary.copy(country_code),
          country: :binary.copy(country),
          city: :binary.copy(city),
          longitude: String.to_float(lon),
          latitude: String.to_float(lat),
          mystery_value: String.to_integer(mystery_val)
        }
      end)
      |> Stream.uniq()
      |> Enum.to_list()
      |> persist_data()

  end

  defp persist_data(data) do
    data
    |> Stream.each(fn dta ->
      changeset = Location.changeset(%Location{}, dta)
      Repo.insert(changeset)
    end)
    |> Stream.run()

  end

end
