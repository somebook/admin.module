$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "admin_module"
  s.version     = Admin::VERSION
  s.authors     = ["Gregory Eremin"]
  s.email       = ["magnolia_fan@me.com"]
  s.homepage    = "https://github.com/somebook/admin.module"
  s.summary     = "Somebook Admin module"
  s.description = "Rails mountable engine that provides admin functionality"

  s.files = Dir["{app,config,lib}/**/*"] + ["README.md"]

  s.add_runtime_dependency "rails"
  s.add_runtime_dependency "devise", "2.1.2"
end
