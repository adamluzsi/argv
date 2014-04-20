# coding: utf-8

Gem::Specification.new do |spec|

  spec.name          = "argv"
  spec.version       = File.open(File.join(File.dirname(__FILE__),"VERSION")).read.split("\n")[0].chomp.gsub(' ','')
  spec.authors       = ["Adam Luzsi"]
  spec.email         = ["adam.luzsi@ppt-consulting.net"]
  spec.description   = %q{ ARGV object extension for parsing flags, inputs, so you can have easy hash objects that contain tag value, and so on :) }
  spec.summary       = %q{ argv object extension for parsing flags, inputs }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"

end
