defmodule GeoLocationServiceCoreTest do
  use ExUnit.Case
  doctest GeoLocationServiceCore

  test "greets the world" do
    assert GeoLocationServiceCore.hello() == :world
  end
end
