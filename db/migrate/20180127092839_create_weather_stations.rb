class CreateWeatherStations < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_stations do |t|
      t.string :name

      t.timestamps
    end

    create_table :readings do |t|
      t.belongs_to :weather_station
      t.date :day
      t.datetime :time
      t.decimal :rainfall_amount
      t.decimal :temperature
      t.decimal :dew_point
      t.decimal :wind_speed
      t.string :wind_direction

      t.timestamps
    end
  end
end
