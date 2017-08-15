module PeopleHr
end

version_file = 'people_hr/version'

if File.file? File.expand_path("#{version_file}.rb", File.dirname(__FILE__))
  require_relative version_file
else
  GoCardlessPro::VERSION = ''
end

require_relative 'people_hr/client.rb'
require_relative 'people_hr/services/employee.rb'