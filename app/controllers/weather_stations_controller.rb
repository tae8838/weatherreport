class WeatherStationsController < ApplicationController
  def index
    @weather_stations = WeatherStation.all.sort_by { |w| w.name }
    respond_to do |format|
      format.html
      format.json { render json: index_pretty_json }
    end
  end

  # def pretty_json
  #   { weather_stations:
  # end

  def test
    state = params[:state]
    BomScraper.update_weather_stations(state)
    @queried_weather_stations = WeatherStation.where(state: state).sort_by { |w| w.name }
    render json: index_pretty_json
  end

  private
  def index_pretty_json
    weather_stations = @queried_weather_stations
    output_json = {}
    output_json = weather_stations.map do |weather_station|
      { name: weather_station.name,
        reading: { "rainfall_amount" => weather_station.readings.last.rainfall_amount,
                   "temperature" => weather_station.readings.last.temperature,
                   "dew_point" => weather_station.readings.last.dew_point,
                   "wind_speed" => weather_station.readings.last.wind_speed,
                   "wind_direction" => weather_station.readings.last.wind_direction,
                   "created_at" => weather_station.readings.last.created_at.strftime("%Y-%m-%d %H:%M:%S"),
                   "updated_at" => weather_station.readings.last.updated_at.strftime("%Y-%m-%d %H:%M:%S") }
      }
    end

    output_json
  end
end