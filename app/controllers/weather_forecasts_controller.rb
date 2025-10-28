class WeatherForecastsController < ApplicationController
  def new
    @weather_forecast = WeatherForecast.new
  end

  def create
    address = params[:weather_forecast][:address]
    zip_code = extract_zip_from_address(address)
    if zip_code
      @weather_forecast, @cached = WeatherForecast.find_or_fetch_by_zip(zip_code, address)
      render :show
    else
      @weather_forecast = WeatherForecast.new(address: address)
      @weather_forecast.errors.add(:address, "Invalid address, could not extract zip code")
      render :new
    end
  end

  private

  def extract_zip_from_address(address)
    match = address.match(/\b\d{5}\b/)
    match ? match[0] : nil
  end
end