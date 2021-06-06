
defmodule GeoLocationServiceCore.GeoLocationTest do
  use ExUnit.Case

  alias GeoLocationServiceCore.Repo
  alias GeoLocationServiceCore.Storage.Location

  @subject GeoLocationServiceCore.GeoLocation
  @known_ip_address "158.76.44.237"
  @unknown_ip_address "127.0.0.1"

  @data %{
    ip_address: "158.76.44.237",
    country_code: "NL",
    country: "Nederland",
    city: "Almere",
    logitude: -130.01370919533787,
    latitude: -45.51980887531106,
    mystery_value: 8499852634
  }

  def fixture context do
    changeset = Location.changeset(%Location{}, @data)
    Repo.insert(changeset)
    :ok
  end

  setup :fixture


  test "get_location_by_ip/1 does not return nil with known ip" do
    refute @subject.get_location_by_ip(@known_ip_address) == nil
  end

  test "it returns nil with unknown ip" do
    assert @subject.get_location_by_ip(@unknown_ip_address) == nil
  end

end
