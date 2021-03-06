require 'lita/rspec'
require 'webmock/rspec'
require 'fakeredis/rspec'

require 'pry'

require 'support/helpers/load_fixture_helper'
require 'support/helpers/client_helper'

Lita.version_3_compatibility_mode = false

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include LoadFixtureHelper
  config.include ClientHelper
end
