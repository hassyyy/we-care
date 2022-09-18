require "active_support/core_ext/integer/time"

Rails.application.configure do
  logger           = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = config.log_formatter
  config.logger    = ActiveSupport::TaggedLogging.new(logger)
end
