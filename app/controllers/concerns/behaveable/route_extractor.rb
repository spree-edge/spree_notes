module Behaveable
  module RouteExtractor
    # Generate url location.
    #
    # ==== Parameters
    # * <tt>behaveable</tt> - Behaveable object.
    # * <tt>resource</tt>   - Resource object. (member routes).
    #
    # ==== Returns
    # * <tt>Route</tt> - Url location.
    def extract(behaveable = nil, resource = nil)
      resource_name   = resource_name_from(params)
      behaveable_name = behaveable_name_from(behaveable)

      location_url = "#{resource_name}_url"
      return regular(location_url, resource) unless behaveable

      location_url = "#{behaveable_name}_#{resource_name}_url"
      nested(location_url, behaveable, resource)
    end

    private

    # Handle non-nested url location.
    #
    # ==== Parameters
    # * <tt>location_url</tt> - Url route as string.
    # * <tt>resource</tt>     - Resource object.
    #
    # ==== Returns
    # * <tt>Route</tt> - Url location.
    def regular(location_url, resource)
      return send(location_url) unless resource
      send(location_url, resource)
    end

    # Handle nested url location.
    #
    # ==== Parameters
    # * <tt>location_url</tt> - Url route as string.
    # * <tt>behaveable</tt>   - Behaveable object.
    # * <tt>resource</tt>     - Resource object.
    #
    # ==== Returns
    # * <tt>Route</tt> - Url location.
    def nested(location_url, behaveable, resource)
      return send(location_url, behaveable) unless resource
      send(location_url, behaveable, resource)
    end

    # Get resource name from params.
    #
    # ==== Parameters
    # * <tt>params</tt> - ApplicationController's params.
    #
    # ==== Returns
    # * <tt>String</tt> - Resource name (singular or plural).
    def resource_name_from(params)
      inflection = params[:id].present? ? 'singular' : 'plural'
      params[:controller].split('/').last.send("#{inflection}ize")
    end

    # Get behaveable class name.
    #
    # ==== Parameters
    # * <tt>behaveable</tt> - Behaveable object.
    #
    # ==== Returns
    # * <tt>String</tt> - Behaveable class snake case name or nil.
    def behaveable_name_from(behaveable)
      return unless behaveable
      behaveable.class.name.underscore
    end
  end
end
