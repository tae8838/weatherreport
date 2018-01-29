class WeatherStationsController < ApplicationController
  def index
    @weather_stations = WeatherStation.all.sort_by { |w| w.name }
  end
end
