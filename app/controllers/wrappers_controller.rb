class WrappersController < ApplicationController
  require './lib/owm_wrapper.rb'
  def weather
    description = OpenWeatherWrapper.get_weather_description(params[:lat], params[:lon])
    render status: :ok, json: description
  end
end
