# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "people_hr/version"

Gem::Specification.new do |spec|
  spec.name          = "people_hr"
  spec.version       = PeopleHr::VERSION
  spec.authors       = %w(Kamran Zafar)
  spec.email         = %w(kami_ravian@yahoo.com)

  spec.summary       = %q{A gem for calling the PeopleHr API}
  spec.description   = "Write a longer description or delete this line."
  spec.homepage      = "https://github.com/kzq/people-hr"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'https://github.com/kzq/people-hr'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency 'webmock'
  spec.add_dependency 'faraday'
end
