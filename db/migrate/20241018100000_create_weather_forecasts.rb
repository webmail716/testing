class CreateWeatherForecasts < ActiveRecord::Migration[8.0]
  def change
    create_table :weather_forecasts do |t|
      t.string :address
      t.string :zip_code
      t.integer :current_temp
      t.integer :high_temp
      t.integer :low_temp
      t.text :forecast_text
      t.datetime :cached_at

      t.timestamps
    end
    add_index :weather_forecasts, :zip_code
    add_index :weather_forecasts, :cached_at
  end
end