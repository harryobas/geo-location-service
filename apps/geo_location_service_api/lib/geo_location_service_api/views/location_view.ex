defmodule GeoLocationServiceApi.LocationView do
  use GeoLocationServiceApi, :view

  alias __MODULE__

  def render("show_location.json", %{location: location}) do
    %{data: render_one(location, LocationView, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{

      country: location.country,
      country_code: location.country_code,
      city: location.city,
      longitude: location.longitude,
      latitude: location.latitude,
      mystery_value: location.mystery_value

    }
  end

end
