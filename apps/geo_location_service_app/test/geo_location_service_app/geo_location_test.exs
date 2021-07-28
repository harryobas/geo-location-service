
defmodule GeoLocationServiceApp.GeoLocationTest do
  use ExUnit.Case

  alias GeoLocationServiceApp.Repo
  alias GeoLocationServiceApp.Storage.Location

  @subject GeoLocationServiceApp.GeoLocation
  @known_ip_address "158.76.44.237"
  @unknown_ip_address "127.0.0.1"

  @data %{
    ip_address: @known_ip_address,
    country_code: "NL",
    country: "Nederland",
    city: "Almere",
    longitude: -130.01370919533787,
    latitude: -45.51980887531106,
    mystery_value: 8499852634
  }

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(GeoLocationServiceApp.Repo)
  end

  describe "get_location_by_ip/1" do
    setup [:fixture]

    test "does not return nil with known ip address", %{location: location} do
      refute @subject.get_location_by_ip(location.ip_address) == nil

    end

    test "it returns nil with unknown ip" do
      assert @subject.get_location_by_ip(@unknown_ip_address) == nil
    end


  end

  defp fixture(_context) do
    changeset = Location.changeset(%Location{}, @data)
    {:ok, location} = Repo.insert(changeset)

    {:ok, location: location}
  end



end
