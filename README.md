<<<<<<< HEAD
# Weather Forecast App

A Ruby on Rails application that accepts an address, retrieves current temperature and extended forecast, caches data for 30 minutes by zip code, and displays results with cache indicators.

## Features

- Address input with zip code extraction
- Current temperature, high/low, and forecast display
- 30-minute caching by zip code
- Cache status indicator
- Unit tests with Minitest

## Architecture

### Models

- **WeatherForecast**: Stores forecast data with caching logic. Uses scopes for recent cache and class method for find or fetch.

### Controllers

- **WeatherForecastsController**: Handles new and create actions for forecast retrieval. Extracts zip from address.

### Views

- **new.html.erb**: Form for address input
- **show.html.erb**: Display forecast details and cache status

## Design Patterns

- **Service Object**: `WeatherForecast.find_or_fetch_by_zip` encapsulates caching and fetching logic.

## Scalability Considerations

- Database indexing on `zip_code` and `cached_at` for efficient queries.
- Caching reduces external API calls; for high traffic, consider Redis or external cache store.
- Mock data used; replace with real API for production scalability.

## Setup

1. `bundle install`
2. `rails db:migrate`
3. `rails server`
4. Visit `/weather_forecasts/new`

For production deployment, integrate a real weather API (e.g., OpenWeatherMap) in `WeatherForecast.fetch_weather_data` method.
=======
[Install ruby and chruby using homebrew](https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/)

[How to create a ruby gem](https://www.honeybadger.io/blog/create-ruby-gem/)

[Installing Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Oracle cloud resources
---
[Terraform with Oracle cloud](https://developer.hashicorp.com/terraform/tutorials/oci-get-started/oci-build)

[Installing Oracle CLI](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm#InstallingCLI__macos_homebrew)

>>>>>>> 23c62bb5f5e20662af31aa26e86263acebd49701
