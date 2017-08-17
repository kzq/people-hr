module PeopleHr
  module Services
    # Service for making requests to the Employee endpoints
    class Employee < BaseService
       
      # Retrieves the details of an existing employee.
      # Example URL: /employee
      #
      # @param identity       # Unique identifier.
      def get(identity)
        options = { params: {'Action' => 'GetEmployeeDetailById','EmployeeId' => identity } }
        response = make_request(:post, endpoint, options)
        #puts ">>>>>>>>>>>>response=#{response.body}"
        return if response.body.nil?
        Resources::Employee.new(response)
      end
      
      def create(options)
        options = { params: options }
        options[:params]['Action'] = 'CreateNewEmployee'
        #puts ">>>>>>>>>>>>>>>employee service create options=#{options}"
        response = make_request(:post, endpoint, options)
        #puts ">>>>>>>>>>>>response=#{response.body}"
        return if response.body.nil?
        get(options[:params][:EmployeeId])
      end
      
      def endpoint
        '/Employee'
      end
      
    end
  end
end