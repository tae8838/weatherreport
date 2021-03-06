require 'nokogiri'
require 'open-uri'

module BomScraper
  def self.update_weather_stations(state = 'VIC')
    weather_station = WeatherStation.find_by(state: state)
    last_reading = weather_station.readings.last unless weather_station.nil?
    return if (Time.now - last_reading.created_at) < 10.minutes unless last_reading.nil?
    url = URL_TO_SCRAPE[state]
    doc = Nokogiri::HTML(open(url))
    output_hash = { }

    doc.css('tbody tr').each do |location|
      name = location.children[1].text
      time = location.children[3].text.match(/[0-9][0-9]\:[0-9][0-9][a-z][a-z]/).to_s
      temperature = location.children[5].text
      dew_point = location.children[9].text
      wind_speed = location.children[17].text
      wind_direction = location.children[15].text
      rainfall_amount = location.children[27].text


      weather_station = WeatherStation.find_or_create_by(name: name, state: state)

      weather_station.readings.create!({time: time,
                                        temperature: temperature,
                                        dew_point: dew_point,
                                        wind_speed: wind_speed,
                                        wind_direction: wind_direction,
                                        rainfall_amount: rainfall_amount})


    end

    output_hash
  end
end
