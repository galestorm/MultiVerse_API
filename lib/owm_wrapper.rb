require 'httparty'

class OpenWeatherWrapper
  APPID = ENV["OWM_ID"]
  BASE_URL = "http://api.openweathermap.org/data/2.5/"

  def self.get_weather_description(lat, lon)
    url = BASE_URL + "weather?lat=#{lat}" + "&lon=#{lon}" + "&APPID=#{APPID}"
    result = HTTParty.get(url)
    #TODO add some logic in here. See Edamam OpenWeatherWrapper

    data = JSON.parse(result.to_s)
    #description = data["weather"][0]["main"]
    return data
  end

end
