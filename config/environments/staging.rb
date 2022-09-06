require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.log_tags = [ :request_id ]
  config.logger = Logger.new(STDOUT)
end
