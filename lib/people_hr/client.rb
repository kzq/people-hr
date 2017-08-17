module PeopleHr
  # A class for working with and talking to the API
  class Client
    attr_accessor :api_key
    
    # Get client configuration
    #
    # @params options[Hash] configurations for creating the client
    # @params options[:symbol] :key api key
    def initialize(options)
      @api_key = options[:api_key] || fail('No access key is given') 
    end
    
    # Access to employee service to make API calls 
    def employees
      @employees ||= Services::Employee.new(@api_key)   
    end
       
  end
end