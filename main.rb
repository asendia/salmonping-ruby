require 'dotenv'
require 'json'
require 'sinatra'

Dotenv.load
set :port, 8080
set :bind, '0.0.0.0'

post '/api/webhook/gofood' do
  request.body.rewind
  raw_body = request.body.read
  signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), ENV['NOTIFICATION_SECRET_KEY'], raw_body)
  if Rack::Utils.secure_compare(signature, request.env['HTTP_X_GO_SIGNATURE'])
    notif = JSON.parse(raw_body)
    "I got some JSON: #{notif.inspect}"
  else
    halt 400, "Signatures didn't match!"
  end
end
