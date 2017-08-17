require 'faraday'
require 'json'

module PeopleHr
end

version_file = 'people_hr/version'

if File.file? File.expand_path("#{version_file}.rb", File.dirname(__FILE__))
  require_relative version_file
else
  GoCardlessPro::VERSION = ''
end

require_relative 'people_hr/client'
require_relative 'people_hr/services/base_service'
require_relative 'people_hr/resources/base_resource'
require_relative 'people_hr/services/employee'
require_relative 'people_hr/resources/employee'