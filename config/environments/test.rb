require "active_support/core_ext/integer/time"

Rails.application.configure do

  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local = true

  config.server_timing = true

  config.action_controller.perform_caching = false

  config.cache_store = :null_store

  config.active_storage.service = :test

  config.action_dispatch.show_exceptions = false

  config.action_controller.allow_forgery_protection = false

  config.active_support.deprecation = :stderr

  config.active_support.disallowed_deprecation = :raise

  config.active_support.disallowed_deprecation_warnings = []

  config.active_record.migration_error = :page_load

  config.active_record.verbose_query_logs = false

end