require 'test_helper'

class WeatherForecastTest < ActiveSupport::TestCase
  test 'should validate presence of address' do
    forecast = WeatherForecast.new(zip_code: '12345')
    assert_not forecast.valid?
    assert_includes forecast.errors[:address], "can't be blank"
  end

  test 'should validate presence of zip_code' do
    forecast = WeatherForecast.new(address: 'Test Address')
    assert_not forecast.valid?
    assert_includes forecast.errors[:zip_code], "can't be blank"
  end

  test 'find_or_fetch_by_zip should return cached data if recent' do
    forecast = WeatherForecast.create!(address: 'Test Address', zip_code: '12345', current_temp: 70, high_temp: 80, low_temp: 60, forecast_text: 'Sunny', cached_at: 10.minutes.ago)
    result, cached = WeatherForecast.find_or_fetch_by_zip('12345')
    assert_equal forecast, result
    assert cached
    assert forecast.reload.cached_at > 10.minutes.ago
  end

  test 'find_or_fetch_by_zip should fetch new data if not cached' do
    result, cached = WeatherForecast.find_or_fetch_by_zip('12345', 'Test Address')
    assert_not cached
    assert_equal '12345', result.zip_code
    assert_equal 'Test Address', result.address
    assert result.persisted?
  end
end