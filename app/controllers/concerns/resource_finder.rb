module ResourceFinder
  def parentable
    klass, param = parentable_class
    klass.find(params[param.to_sym])
  end

  private

  def parentable_class
    params.each_key do |name|
      if name.match?(/(.+)_id$/)
        model = name[/([^\/.]*)_id$/, 1]
        return model.classify.safe_constantize, name
      end
      nil
    end
  end
end
