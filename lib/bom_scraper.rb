require 'nokogiri'
require 'open-uri'

URL = 'http://www.bom.gov.au/vic/observations/melbourne.shtml'

module BomScraper
  def self.generate_readings
    doc = Nokogiri::HTML(open(URL))

    doc.css('tbody tr').each do |location|
      name = location.children[1].text
      datetime = location.children[3].text
      temperature = location.children[5].text
      dew_point = location.children[9].text
      wind_speed = location.children[17].text
      wind_direction = location.children[15].text
      rainfall_amount = location.children[27].text

      weather_station = WeatherStation.find_or_create_by(name: name)

      reading = weather_station.readings.new

      reading.update_attributes(day: datetime,
                                time: datetime,
                                temperature: temperature,
                                dew_point: dew_point,
                                wind_speed: wind_speed,
                                wind_direction: wind_direction,
                                rainfall_amount: rainfall_amount)
      reading.save!
    end
  end
end