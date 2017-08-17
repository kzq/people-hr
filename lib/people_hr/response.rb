module PeopleHr
  # A class to wrap an API response
  class Response
    extend Forwardable

    def_delegator :@response, :headers
    def_delegator :@response, :status, :status_code

    # Initialize a response instance
    # @param response an API response
    def initialize(response)
      @response = response
    end

    # Return the body of parsed JSON body of the API response
    def body
      JSON.parse(@response.body) unless @response.body.empty?
    end

  end
end