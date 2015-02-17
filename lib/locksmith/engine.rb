module Locksmith
  require 'sass/rails'

  class Engine < ::Rails::Engine
    isolate_namespace Locksmith

    config.generators do |g|
      g.test_framework :rspec
    end

    # Make Bourbon and Neat work in a mountable engine by forcefully adding them to sass load paths

    initializer 'bourbon' do
      Sass.load_paths << stylesheets_path('bourbon')
    end

    initializer 'neat' do
      Sass.load_paths << stylesheets_path('neat')
    end

    private

    def gem_path(gem)
      Gem::Specification.find_by_name(gem).gem_dir
    end

    def stylesheets_path(gem)
      File.join(gem_path(gem), 'app', 'assets', 'stylesheets')
    end
  end
end
