module AhaApi
  class Resource
    module Features
      def create_feature(name, description, options = {})
        post("api/#{api_version}/features", options.merge({ :name => name, :description => description }))
      end

      # client.features(options = {})
      # https://www.aha.io/api/resources/features#anchor-resource-features-example-get_all_features
      def features(options = {})
        get("api/#{api_version}/features", options)
      end

      def feature(ref, options = {})
        get("api/#{api_version}/features/#{ref}", options)
      end

      def update_feature(ref, options = {})
        put("api/#{api_version}/features/#{ref}", options)
      end

      # client.create_feature_in_release('name', 'description', 'PROD-R-1', options = {})
      # https://www.aha.io/api/resources/features#anchor-resource-features-example-create_a_feature
      def create_feature_in_release(name, description, release, options = {})
        post("api/#{api_version}/releases/#{release}/features", options.merge({ :name => name, :description => description }))
      end

      # client.features_in_release('DEMO-R-3')
      # https://www.aha.io/api/resources/features#anchor-resource-features-example-create_a_feature_in_the_default_release
      def features_in_release(release, options = {})
        get("api/#{api_version}/releases/#{release}/features", options)
      end

      # client.create_feature_in_product('name', 'description', 'PROD', options = {})
      def create_feature_in_product(name, description, product, options = {})
        post("api/#{api_version}/releases/#{product}/features", options.merge({ :name => name, :description => description }))
      end

      # client.features_in_product('DEMO-R-3')
      # https://www.aha.io/api/resources/features#anchor-resource-features-example-get_all_features_for_a_product
      def features_in_product(product, options = {})
        get("api/#{api_version}/products/#{release}/features", options)
      end
    end
  end
end
