require 'simplecov'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/play'
require 'pry'

SimpleCov.start

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end