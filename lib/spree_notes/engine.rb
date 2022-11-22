module SpreeNotes
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_notes'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "spree_notes.include_view_helpers" do |app|
      ActiveSupport.on_load :action_view do
        include Spree::NotesHelper
      end
    end

    initializer 'spree_notes.environment', before: 'spree.environment' do |app|
      require File.join(File.dirname(__FILE__), '../../app/models/spree_notes/configuration.rb')
    end

    initializer 'spree_notes.environment', before: :load_config_initializers do |_app|
      SpreeNotes::Config = SpreeNotes::Configuration.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/**/*_helper.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
