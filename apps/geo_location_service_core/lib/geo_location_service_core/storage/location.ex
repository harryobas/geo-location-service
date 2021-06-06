defmodule GeoLocationServiceCore.Storage.Location do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  @fields [
    :ip_address,
    :country_code,
    :country,
    :city,
    :longitude,
    :latitude,
    :mystery_value
  ]


  schema "locations" do
    field :ip_address, :string
    field :country_code, :string
    field :country, :string
    field :city, :string
    field :longitude, :float
    field :latitude, :float
    field :mystery_value, :integer


    timestamps()
  end

  def changeset(%Location{}=record, attrs) do
    record
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
