require_relative '../request'
module PeopleHr
  # Module that contains all services for making requests to the API.
  module Services
    # Base Service that all services inherit from.
    class BaseService
      # Create a new service instance to make requests against
      #
      # @param api_service [PeopleHr::ApiService}}] an instance of the ApiService
      def initialize(api_key)
        @api_key = api_key
      end
       
      def root_url
        'https://api.peoplehr.net'
      end 
      # Make a request to the API using the API service instance
      #
      # @param method [Symbol] the method to use to make the request
      # @param path [String] the URL (without the base domain) to make the request to
      # @param options [Hash] the options hash - either the query parameters for a GET, or the body if POST/PUT
      def make_request(method, endpoint, options = {})
        fail ArgumentError, 'options must be a hash' unless options.is_a?(Hash)
        options = add_key(options,({params: {APIKey: @api_key}}))
        #puts ">>>>>>>>>>>>>>>>>>>base options=#{options}"
        Request.new(method, root_url , endpoint, options).request
      end
      
      private
      
      def add_key(a, b)
        a.merge(b) {|key, a_item, b_item| add_key(a_item, b_item) }
      end
    end
  end
end