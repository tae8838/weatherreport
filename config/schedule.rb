every 10.minutes do
  rake 'weather_station:update_readings', output: 'log/update_weather_station.log'
end