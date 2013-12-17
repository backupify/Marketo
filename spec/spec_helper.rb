require 'vcr'
require 'timecop'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end
VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { :record => :none, :match_requests_on => [:method, :uri, :body] }
end

module Rails
  def self.root
    File.dirname(__FILE__)
  end

  def self.env
    :test
  end
end
