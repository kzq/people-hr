# PeopleHr Ruby Client

Integrate PeopleHr api within your application. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'people_hr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install people_hr

## Usage

	# Get Client
    client   =  PeopleHr::Client.new(api_key: 'my_key')
    
    # Get Employee
	employee = client.employees.get('employee_id')
    
    # Get Employee details
    employee.name, employee.title, employee.address etc.
    
    # Create a new Employee
    employee_data = { EmployeeId:"#{random_str}", Title:"Mr.", FirstName:"Abc", LastName:"Xyz",
           Email:"email@yahoo.com", Gender:"Male", StartDate:"2017-01-01", DateOfBirth:"1987-01-02", JobRole:"Software Enginner",
           JobRoleEffectiveDate:"2014-01-01", Location:"London", Department:"IT"
        }
	new_employee = client.employees.create(employee_data)

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/people_hr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PeopleHr project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/people_hr/blob/master/CODE_OF_CONDUCT.md).
