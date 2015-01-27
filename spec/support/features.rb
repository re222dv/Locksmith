require_relative 'features/session_helpers'

module Locksmith
  RSpec.configure do |config|
    config.include SessionHelpers, type: :feature
  end
end
