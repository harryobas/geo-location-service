defmodule GeoLocationServiceApi.Router do
  use GeoLocationServiceApi, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GeoLocationServiceApi do
    pipe_through :api

    get "/locations/:ip", LocationController, :show_location
  end
end
