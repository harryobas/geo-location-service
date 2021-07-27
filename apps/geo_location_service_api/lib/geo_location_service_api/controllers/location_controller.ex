defmodule GeoLocationServiceApi.LocationController do
  use GeoLocationServiceApi, :controller

  alias GeoLocationServiceApp.GeoLocation
  alias GeoLocationServiceApi.ErrorView

  def show_location(conn, %{"ip" => ip}) do
    with {:ok, location} <- GeoLocation.get_location_by_ip(ip) do
      render(conn,"show_location.json",location: location)
    else
      nil ->
        conn
        |> put_status(:not_found)
        |> render(ErrorView, "404.json",
        message: "The ip address provided does not correspond to a valid location")
    end
  end

end
