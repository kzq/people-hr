require_relative 'response'
module PeopleHr
  class Request
    # Initialize a request class, which makes calls to the API
    # @param method [Symbol] the method to make the request with
    # @param path [String] the path to make the request to
    # @param options [hash] options for the request
    def initialize(method, root_url, endpoint, options)
      @method = method
      @root_url = root_url
      @endpoint = endpoint
      @given_options = options
      @request_body = request_body
      if @request_body.is_a?(Hash)
        @request_body = @request_body.to_json
      end
      @connection = connection
    end
    
    def connection
      connection = Faraday.new(@root_url) do |faraday|
        faraday.request  :url_encoded 
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end
    
    # Fetch the body to send with the request
    def request_body
      if @method == :get
        nil
      elsif [:post, :put, :delete].include?(@method)
        @given_options.fetch(:params, {})
      else
        fail "Unknown request method #{@method}"
      end
    end
    
    # Make the request and wrap it in a Response object
    def request
      Response.new(make_request)
    end
    
    # Make the API request
    def make_request
      @connection.send(@method) do |request|
        request.url @endpoint
        request.body = @request_body
        request.params = request_query
        #puts ">>>>>>>>>>>>>>>>>>>>..request request.body=#{request.body}"
        #puts ">>>>>>>>>>>>>>>>>>>>..request request.params=#{request.params}"
        request.headers['Content-Type'] = 'application/json'
      end
    end
    
    # Get the query params to send with the request
    def request_query
      if @method == :get
        @given_options.fetch(:params, {})
      else
        {}
      end
    end
  end
end