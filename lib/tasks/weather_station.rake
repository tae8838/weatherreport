namespace :weather_station do
  desc 'call WeatherStation.update_readings'
  task :update_readings => :environment do
    BomScraper.update_weather_stations
  end
end
