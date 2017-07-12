ENV["RACK_ENV"] = "test"
require_relative '../../app'
raise "test database doesn't end with test" unless DB.opts[:database] =~ /test\z/

require 'rack/test'

require_relative '../minitest_helper'

class Minitest::Spec
  include Rack::Test::Methods
end
