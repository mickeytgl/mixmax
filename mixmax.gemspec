
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mixmax/version"

Gem::Specification.new do |spec|
  spec.name          = "mixmax"
  spec.version       = Mixmax::VERSION
  spec.authors       = ["Miguel Torres"]
  spec.email         = ["migueltg93@gmail.com"]

  spec.summary       = %q{A ruby wrapper around MixMax's API}
  spec.homepage      = "https://github.com/mickeytgl/mixmax"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "httparty", ">= 0.16.4", "< 0.22.0"
end
