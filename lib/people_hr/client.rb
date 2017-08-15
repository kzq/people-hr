module PeopleHr
  # A class for working with and talking to the API
  class Client
    attr_accessor :key
    
    # Get client configuration
    #
    # @params options[Hash] configurations for creating the client
    # @params options[:symbol] :key api key
    def initialize(options)
      @key = options[:key] || fail('No access key is given') 
    end
    
    # Access to employee service to make API calls 
    def employees
      @employees ||= Services::Employee.new(@key)   
    end
       
  end
end