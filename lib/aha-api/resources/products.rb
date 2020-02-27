module AhaApi
  class Resource
    module Products
      def products(options = {})
        get("api/#{api_version}/products", options)
      end
    end
  end
end
