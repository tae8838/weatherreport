class WeatherStationsController < ApplicationController
  def index
    @weather_stations = WeatherStation.all
  end
end
