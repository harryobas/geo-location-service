defmodule GeoLocationServiceApi.LocationControllerTest do
  use GeoLocationServiceApi.ConnCase

  alias GeoLocationServiceApp.Storage.Location
  alias GeoLocationServiceApp.Repo

  @valid_ip_address %{"query" => %{"ip" => "85.68.71.24"}}
  @invalid_ip_address %{"query" => %{"ip" => "127.0.0.1"}}

  setup [:create_location]

  describe "find_location/2" do
    test "responds with location info if location is found", %{conn: conn} do

      response =
        conn
        |> post(Routes.location_path(conn, :find_location, @valid_ip_address))
        |> json_response(200)

        expected = %{
          "data" => %{
            "city" => "New Alessiaview",
            "country" => "Netherlands",
            "country_code" => "PA",
            "latitude" => 174.57963021150817,
            "longitude" => -1.5710614893880432,
            "mystery_value" => 3326541859
          }
        }

        assert response == expected

    end
    test "responds with error if location is not found", %{conn: conn} do
      response =
        conn
        |> post(Routes.location_path(conn, :find_location, @invalid_ip_address))

        assert json_response(response, 404)["error"] =~ "not found"
    end
  end

  defp create_location(_) do
    attrs = %{
      ip_address: @valid_ip_address["query"]["ip"],
      city: "New Alessiaview",
      country: "Netherlands",
      country_code:  "PA",
      latitude: 174.57963021150817,
      longitude: -1.5710614893880432,
      mystery_value: 3326541859
    }

    changeset = Location.changeset(%Location{}, attrs)
    Repo.insert(changeset)
    :ok

  end


end
