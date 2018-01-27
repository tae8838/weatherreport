class WeatherStationsController < ApplicationController
  def index
    @weather_stations = []
    BomScraper.parse_url.each do |report|
      name = report.first
      @weather_stations << weather_station = WeatherStation.find_or_create_by(name: name)

      reading = weather_station.readings.new(report.second)
      reading.save!
    end
  end
end
