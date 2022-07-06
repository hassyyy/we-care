account_sid = ENV.fetch('TWILIO_ACCOUNT_SID')
auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')
$twilio_client = Twilio::REST::Client.new(account_sid, auth_token)
$twilio_messaging_service_id = ENV.fetch('TWILIO_MESSAGING_SERVICE_ID')
