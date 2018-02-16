class AddStateToWeatherStation < ActiveRecord::Migration[5.1]
  def change
    add_column :weather_stations, :state, :string
  end
end
