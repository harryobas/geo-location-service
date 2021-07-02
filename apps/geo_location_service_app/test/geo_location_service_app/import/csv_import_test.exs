defmodule GeoLocationServiceApp.Import.CSVImportTest do
  use ExUnit.Case

  @subject GeoLocationServiceApp.Import.CSVImport
  @raw_data_file Application.get_env(:geo_location_service_app, :raw_data_file)

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(GeoLocationServiceApp.Repo)
  end

  test "import_geo_location_data/1 returns :ok" do
    assert @subject.import_geo_location_data(@raw_data_file) == :ok
  end

end
