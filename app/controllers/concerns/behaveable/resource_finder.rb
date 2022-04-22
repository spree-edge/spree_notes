module Behaveable
  module ResourceFinder
    # Get the behaveable object.
    #
    # ==== Returns
    # * <tt>ActiveRecord::Model</tt> - Behaveable instance object.
    def behaveable
      klass, param = behaveable_class
      return unless klass

      _attr = col(klass)
      klass.find_by!("#{_attr}" => params[param.to_sym])
    end

    private

    # Lookup behaveable class.
    #
    # ==== Returns
    # * <tt>Response</tt> - Behaveable class object or nil if not found.
    def behaveable_class
      params.each do |name, _value|
        if name =~ /(.+)_id$/
          model = name.match(%r{([^\/.]*)_id$})
          spree_model = "Spree::#{model[1].classify}"
          return spree_model.constantize, name
        end
      end
      nil
    end

    def col(klass)
      case klass.name
      when "Spree::Order"
        'number'
      when "Spree::Product"
        'slug'
      else
        'id'
      end
    end
  end
end
