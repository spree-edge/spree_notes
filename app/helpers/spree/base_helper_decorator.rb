module Spree
  module BaseHelperDecorator
    include ::Spree::NotesHelper
  end
end

::Spree::BaseHelper.prepend ::Spree::BaseHelperDecorator
