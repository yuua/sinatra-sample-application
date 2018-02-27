require_relative '../app'
require 'minitest/autorun'
require 'rack/test'
require 'minitest/hooks/default'
require 'database_cleaner'

ActiveRecord::Base.establish_connection(:test)

class ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def teardown
    DatabaseCleaner.clean
  end
end
