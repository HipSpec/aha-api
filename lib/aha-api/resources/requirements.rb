module AhaApi
  class Resource
    module Requirements
      # client.create_feature_in_release('name', 'description', 'PROD-1', options = {})
      # https://www.aha.io/api/resources/requirements#anchor-resource-requirements-example-create_a_requirement
      def create_requirement_in_feature(name, description, feature, options = {})
        post("api/#{api_version}/features/#{feature}/requirements", options.merge({ :name => name, :description => description }))
      end
    end
  end
end
