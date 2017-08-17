module PeopleHr
  module Resources
    class BaseResource
      def initialize(response = nil)
        @response = response.body
        @object = @response['Result']
        map_result(@object)
      end
      
      def map_result(result)
        result.each do |item|
          #puts "==================item = #{item}===================="
          #puts ">>>>>>>>>>>>>>>>>>item[0] = #{item[0]}"
          #puts ">>>>>>>>>>>>>>>>>>item[1] = #{item[1]}"
          attr = item[0].gsub(/(?<=[a-z])(?=[A-Z])/, '_').downcase
          #puts ">>>>>>>>>>>>>>>>>>>.attr=#{attr}"
          instance_variable_set("@#{attr}", get_value(item[1])) 
          self.class.send(:attr_accessor,attr)
        end  
      end
      
      def get_value(object_hash)
        if object_hash.is_a?(Hash) 
          object_hash['DisplayValue'] unless nil && object_hash.empty? 
        else 
          object_hash
        end
      end
    end
  end
end