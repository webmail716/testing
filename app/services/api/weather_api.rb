# https://medium.com/@bamnelkarvivek/how-i-made-a-simple-weather-app-in-ruby-on-rails-309cdced25aa

# JG - This code requires an API_KEY and a PAID subscription to the service, which I do not have.
# The code below is commented out because of the above reason.
# require 'httparty'
class Api::WeatherApi
#   include HTTParty

#   base_uri 'https://api.openweathermap.org/data/2.5'

#   def initialize(api_key)
#     @options = { query: { appid: api_key } }
#   end

  
#   def fetch_weather(opts)
#     zip_code = opts[:zip_code] || ''

#     if zip_code.present?
#       rval = weather_by_zip(zip_code)
#     else
#       city = opts[:city] || 'San Francisco'
#       rval = weather_by_city(city)
#     end

#     rval
#   end

#   def weather_by_zip(zip_code)
#     self.class.get("/weather?zip=#{zip_code}", @options)
#   end

#   def weather_by_city(city)
#     self.class.get("/weather?q=#{city}", @options)
#   end
end
