
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Email_Project/version"

Gem::Specification.new do |spec|
  spec.name          = "Email_Project"
  spec.version       = EmailProject::VERSION
  spec.authors       = ["'Matthew Ryan Palmer'"]
  spec.email         = ["'matthewpalmer9@outlook.com'"]

  spec.summary       = %q{A project aiming to implement receiving-only/site hosted admin email. }
  spec.description   = %q{This project aims to have an admin-access-only email page which will elminiate the need for email hosting. All client inqueries will be exclusive to the website with no third-party intervention.}
  spec.homepage      = "http://www.github.com/MatthewPalmer9/Email_Project"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "http://www.github.com/MatthewPalmer9/Email_Project"
    spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
