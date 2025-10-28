require 'test_helper'

class WeatherForecastsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_weather_forecast_url
    assert_response :success
    assert assigns(:weather_forecast).is_a?(WeatherForecast)
    assert assigns(:weather_forecast).new_record?
  end

  test 'should create forecast with valid address' do
    assert_difference('WeatherForecast.count') do
      post weather_forecasts_url, params: { weather_forecast: { address: '123 Main St 12345' } }
    end
    assert_response :success
    assert_template :show
  end

  test 'should not create forecast with invalid address' do
    assert_no_difference('WeatherForecast.count') do
      post weather_forecasts_url, params: { weather_forecast: { address: 'No zip' } }
    end
    assert_response :success
    assert_template :new
  end
end