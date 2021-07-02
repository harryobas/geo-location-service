defmodule GeoLocationServiceApp.Repo do
  use Ecto.Repo,
    otp_app: :geo_location_service_app,
    adapter: Ecto.Adapters.Postgres

  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
