class WeatherForecast < ApplicationRecord
  validates :address, presence: true
  validates :zip_code, presence: true

  scope :cached_recently, -> { where('cached_at > ?', 30.minutes.ago) }

  def self.find_or_fetch_by_zip(zip_code, address = nil)
    forecast = cached_recently.find_by(zip_code: zip_code)
    
    if forecast.present?
      forecast.update(cached_at: Time.current)
      rval = [forecast, true]
    else
      data = fetch_weather_data(zip_code)
      forecast = create!(
        address: address,
        zip_code: zip_code,
        current_temp: data[:current_temp],
        high_temp: data[:high_temp],
        low_temp: data[:low_temp],
        forecast_text: data[:forecast],
        cached_at: Time.current
      )
      rval = [forecast, false]
    end
  end

  def self.fetch_weather_data(zip_code)
    # api = Api::WeatherApi.new(ENV['WEATHER_API_KEY'])

    # response = api.weather_by_zip(zip_code)

    # Mock data for demonstration
    {
      current_temp: rand(50..80),
      high_temp: rand(70..90),
      low_temp: rand(40..60),
      forecast: "Sunny with a chance of rain."
    }
  end
end