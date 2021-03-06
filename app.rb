require_relative 'models'

require 'roda'

class Wassal < Roda
  opts[:unsupported_block_result] = :raise
  opts[:unsupported_matcher] = :raise
  opts[:verbatim_string_matcher] = true

  plugin :default_headers,
    'Content-Type'=>'application/json',
    'Content-Security-Policy'=>"default-src 'self' https://oss.maxcdn.com/ https://maxcdn.bootstrapcdn.com https://ajax.googleapis.com",
    #'Strict-Transport-Security'=>'max-age=16070400;', # Uncomment if only allowing https:// access
    'X-Frame-Options'=>'deny',
    'X-Content-Type-Options'=>'nosniff',
    'X-XSS-Protection'=>'1; mode=block'

  use Rack::Session::Cookie,
    :key => '_Wassal_session',
    #:secure=>!TEST_MODE, # Uncomment if only allowing https:// access
    :secret=>File.read('.session_secret')

  plugin :csrf
  plugin :multi_route
  plugin :json, :classes=>[Array, Hash, Sequel::Model]

  Unreloader.require('routes'){}

  route do |r|
    r.multi_route

    r.root do
    end
  end
end
