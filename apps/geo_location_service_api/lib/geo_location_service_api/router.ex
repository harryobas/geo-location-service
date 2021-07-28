defmodule GeoLocationServiceApi.Router do
  use GeoLocationServiceApi, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GeoLocationServiceApi do
    pipe_through :api

    post "/locations", LocationController, :find_location
  end
end
