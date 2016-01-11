require 'rubygems'
require 'minitest/spec'
require 'minitest/autorun'
require 'rack/mock'
require 'rack/test'
require 'coveralls'

require_relative '../lib/rack/merge-cookies'

Coveralls.wear!

describe Rack::MergeCookies do
  include Rack::Test::Methods

  def app; Rack::Lint.new(@app); end

  def mock_app(options_or_options_array = {})
    main_app = lambda { |env|
      headers = {'Content-Type' => "text/html"}
      [200, headers, ['Hello there']]
    }

    builder = Rack::Builder.new
    options_or_options_array = [options_or_options_array] unless options_or_options_array.is_a?(Array)
    Array(options_or_options_array).each do |options|
      builder.use Rack::MergeCookies, options
    end
    builder.run main_app
    @app = builder.to_app
  end

  before do
    mock_app([header_name: 'X-COOKIE'])
  end

  it 'should merge the user-defined header to cookies' do
    header 'COOKIE', 'foo=1; bar=2;'
    header 'X-COOKIE', 'baz=3;'
    get 'http://www.example.org'
    last_request.env['HTTP_COOKIE'].must_equal('foo=1; bar=2; baz=3;')
  end
end
