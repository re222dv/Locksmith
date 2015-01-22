module Locksmith
  class Engine < ::Rails::Engine
    isolate_namespace Locksmith

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
