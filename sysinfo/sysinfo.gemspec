Gem::Specification.new do |spec|
  spec.name          = "sysinfo"
  spec.version       = '1.0'
  spec.authors       = ["Jason Greschler"]
  spec.email         = ["jagreschler@gmail.com"]
  spec.summary       = "Prints system information."
  spec.files         = ["bin/sysinfo", "lib/sysinfo.rb"]
  spec.bindir        = "bin"
  spec.executables   = ["sysinfo"]
  spec.require_paths = ["lib"]
end