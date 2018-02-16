require 'rails_helper'

describe BomScraper do
  it 'scrapes BOM website successfully' do
    expect(WeatherStation.count).to eq 0

    output = VCR.use_cassette('update_weather_stations') { described_class.update_weather_stations }

    expect(WeatherStation.count).to eq 21

    weather_station = WeatherStation.find_by(name: 'Avalon')
    reading = weather_station.readings.first

    expect(reading.rainfall_amount).to eq 0
    expect(reading.temperature).to eq 21.5
    expect(reading.dew_point).to eq 21.3
    expect(reading.wind_speed).to eq 15
    expect(reading.wind_direction).to eq 'SW'
  end

  context 'with a reading recently created' do
    let!(:weather_station) do
      WeatherStation.create!(state: 'VIC')
    end

    let!(:reading) do
      weather_station.readings.create
    end

    it 'scrapes BOM website successfully' do
      expect(WeatherStation.count).to eq 1
      expect(Reading.count).to eq 1

      output = VCR.use_cassette('update_weather_stations') { described_class.update_weather_stations }

      expect(WeatherStation.count).to eq 1
      expect(Reading.count).to eq 1
    end
  end
end