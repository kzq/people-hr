require 'securerandom'
load 'lib/people_hr.rb'

puts "=========== Client"

client = PeopleHr::Client.new(api_key: 'my_key')

puts "client.api_key = #{client.api_key}" 

puts "===========Get employee..."

employee=client.employees.get('PW1')

puts "===========Employee details..."

puts "name=#{employee.name}"
puts "title=#{employee.title}"
puts "first_name=#{employee.first_name}"
puts "last_name=#{employee.last_name}"
puts "other_name=#{employee.other_name}"
puts "date_of_birth=#{employee.date_of_birth}"
puts "address=#{employee.address}"
puts "email=#{employee.email_id}"
puts "work_phone_number=#{employee.work_phone_number}"
puts "personal_phone_number=#{employee.personal_phone_number}"

puts "===========Create an Employee..."
random_str = SecureRandom.hex(5)
new_employee = { EmployeeId:"#{random_str}", Title:"Mr.", FirstName:"K#{random_str}", LastName:"Z#{random_str}",
  Email:"#{SecureRandom.uuid}@dt.co.uk", Gender:"Male", StartDate:"2014-01-01", DateOfBirth:"1987-01-02", JobRole:"Software Enginner",
  JobRoleEffectiveDate:"2014-01-01", Location:"London", Department:"IT"
 }

employee=client.employees.create(new_employee)


puts "name=#{employee.name}"
puts "title=#{employee.title}"
puts "first_name=#{employee.first_name}"
puts "last_name=#{employee.last_name}"
puts "other_name=#{employee.other_name}"
puts "date_of_birth=#{employee.date_of_birth}"
puts "address=#{employee.address}"
puts "email=#{employee.email_id}"
puts "work_phone_number=#{employee.work_phone_number}"
puts "personal_phone_number=#{employee.personal_phone_number}"