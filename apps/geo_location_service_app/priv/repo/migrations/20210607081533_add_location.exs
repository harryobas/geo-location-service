defmodule GeoLocationServiceApp.Repo.Migrations.AddLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :ip_address, :string
      add :country_code, :string
      add :country, :string
      add :city, :string
      add :longitude, :float
      add :latitude, :float
      add :mystery_value, :bigint

      timestamps()
    end

  end
end
