defmodule GeoLocationServiceApp.Import.DataSanitizer do

  def sanitize(ip, country_code, country, city, lon, lat, mystery_val) do
    valid_ip_address?(ip) &&
    valid_country_code?(country_code) &&
    valid_country?(country) &&
    valid_city?(city) &&
    valid_longitude?(lon) &&
    valid_latitude?(lat) &&
    valid_mystery_value?(mystery_val)
  end

  defp valid_ip_address?(ip) do
    ip != nil && Iptools.is_ipv4?(ip)
  end

  defp valid_country_code?(country_code) do
    country_code != nil &&
    String.length(country_code) == 2 &&
    alphabetic?(country_code)
  end

  defp valid_country?(country) do
    country != nil && alphabetic?(country)
  end

  defp valid_city?(city) do
    city != nil && alphabetic?(city)
  end

  defp valid_longitude?(lon) do
    lon != nil && float?(lon)
  end

  defp valid_latitude?(lat) do
    lat != nil && float?(lat)
  end

  defp valid_mystery_value?(mystery_val) do
    mystery_val != nil &&
    integer?(mystery_val) &&
    String.to_integer(mystery_val) != 0
  end

  defp alphabetic?(string) do
    case Integer.parse(string) do
      {_, ""} -> false
       {_, _} -> false
      _ -> true
    end
  end

  defp float?(val) do
    case Float.parse(val) do
      {_, ""} -> true
      _ -> false
    end
  end

  defp integer?(val) do
    case Integer.parse(val) do
      {_num, ""} -> true
      _ -> false
    end
  end


end
