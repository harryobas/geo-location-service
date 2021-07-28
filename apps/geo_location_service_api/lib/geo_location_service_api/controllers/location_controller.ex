defmodule GeoLocationServiceApi.LocationController do
  use GeoLocationServiceApi, :controller

  alias GeoLocationServiceApp.GeoLocation
  alias GeoLocationServiceApi.ErrorView

  def find_location(conn, %{"query" => params}) do
    ip_address = params["ip"]
    with {:ok, location} <- GeoLocation.get_location_by_ip(ip_address) do
      render(conn,"find_location.json",location: location)
    else
      nil ->
        conn
        |> put_status(:not_found)
        |> render(ErrorView, "404.json",
        message: "The ip address provided does not correspond to a valid location")
    end
  end

end
