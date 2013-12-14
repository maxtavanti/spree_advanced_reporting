module SpreeAdvancedReporting
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_advanced_reporting'

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end

# module Spree
  # module SpreeAdvancedReporting
    # class Engine < Rails::Engine
      # engine_name "spree_advanced_reporting"
# 
      # config.autoload_paths += %W(#{config.root}/lib)
# 
      # initializer :assets do |config|
        # Rails.application.config.assets.precompile += %w( admin/advanced_reporting/advanced_reporting.css )
      # end
# 
      # def self.activate
        # Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator.rb")).each do |c|
          # Rails.env.production? ? require(c) : load(c)
        # end
      # end
# 
      # config.to_prepare &method(:activate).to_proc
    # end
  # end
# end