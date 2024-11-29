module SpreeNotes
  module Spree
    module Admin
      module Tabs
        module UserDefaultTabsBuilderDecorator
          def build
             root = super

             add_notes_tab(root)

             root
          end

          private

          def add_notes_tab(root)
            tab = ::Spree::Admin::Tabs::TabBuilder.new(
                  ::Spree.t('admin.notes'),
                  ->(resource) { ::Spree::Core::Engine.routes.url_helpers.polymorphic_path([:admin, resource, ::Spree::Note]) })
                  .with_icon_key('file')
                  .with_active_check
                  .with_availability_check(
                    lambda do |ability, resource|
                      ability.can?(:admin, ::Spree::Note) && ::SpreeNotes::Configuration.new[:noteables].include?('spree_users')
                    end
                  )
                  .build

            root.add(tab)
          end
        end
      end
    end
  end
end

::Spree::Admin::Tabs::UserDefaultTabsBuilder.prepend(SpreeNotes::Spree::Admin::Tabs::UserDefaultTabsBuilderDecorator)
