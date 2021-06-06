defmodule GeoLocationServiceCore.GeoLocation do
  import Ecto.Query, warn: false

  alias GeoLocationServiceCore.Repo

  def get_location_by_ip(ip_address) do
    query = from l in "locations",
    where: l.ip_address == ^ip_address,
    select: %{
      country_code: l.country_code,
      country: l.country,
      city: l.city,
      longitude: l.longitude,
      latitude: l.latitude,
      mystery_value: l.mystery_value
    }

    Repo.all(query)|> List.first()
  end

end
