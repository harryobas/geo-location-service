defmodule GeoLocationServiceCore.Import.CSVImportTest do
  use ExUnit.Case

  @subject GeoLocationServiceCore.Import.CSVImport

  @raw_data_file Application.get_env(:geo_location_service_core, :raw_data_file)

  test "import_geo_location_data/1 returns :ok" do
    assert @subject.import_geo_location_data(@raw_data_file) == :ok
  end

end
