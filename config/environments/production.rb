require "active_support/core_ext/integer/time"

Rails.application.configure do

  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local = false

  config.server_timing = false

  config.action_controller.perform_caching = true

  config.cache_store = :memory_store

  config.active_storage.service = :local

  config.action_dispatch.show_exceptions = false

  config.active_support.deprecation = :notify

  config.active_support.disallowed_deprecation = :log

  config.active_support.disallowed_deprecation_warnings = []

  config.active_record.dump_schema_after_migration = false

end