module Behaveable
  module ResourceFinder
    # Get the behaveable object.
    #
    # ==== Returns
    # * <tt>ActiveRecord::Model</tt> - Behaveable instance object.
    def behaveable
      klass, param = behaveable_class
      return unless klass

      klass.column_names.include?("number") ? klass.find_by!(number: params[param.to_sym]) : klass.find(params[param.to_sym])
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
  end
end
