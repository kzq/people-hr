module PeopleHr
  module Resources
    class Employee < BaseResource
      def name
        @first_name+' '+@last_name  
      end
      
      def address
       @object['ContactDetail']['Address']['DisplayValue']    
      end
      
      def work_phone_number
       @object['ContactDetail']['WorkPhoneNumber']['DisplayValue']    
      end
      
      def personal_phone_number
       @object['ContactDetail']['PersonalPhoneNumber']['DisplayValue']    
      end
    end
  end
end      