defmodule GeoLocationServiceCore.Repo do
  use Ecto.Repo,
    otp_app: :geo_location_service_core,
    adapter: Ecto.Adapters.SQLite3
end
