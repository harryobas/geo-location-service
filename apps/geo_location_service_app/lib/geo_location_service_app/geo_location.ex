defmodule GeoLocationServiceApp.GeoLocation do
  import Ecto.Query, warn: false

  alias GeoLocationServiceApp.Repo
  alias GeoLocationServiceApp.Storage.Location

  def get_location_by_ip(ip_address) do
    location = Repo.one(
      from l in Location,
      where: l.ip_address == ^ip_address
    )

    if location do
      {:ok, location}
    end

  end

end
