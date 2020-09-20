require_relative 'lib/magiclink/version'

Gem::Specification.new do |spec|
  spec.name          = 'magiclink_admin_sdk'
  spec.version       = Magiclink::VERSION
  spec.authors       = ['Aref Aslani']
  spec.email         = ['arefaslani@gmail.com']

  spec.summary       = 'Magic.link Ruby admin SDK'
  spec.description   = 'Admin SDK for Magic.link'
  spec.homepage      = 'https://github.com/LicenseRocks/magiclink-ruby-sdk'
  spec.license       = 'GPL-3.0'
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 1.0.1'
  spec.add_dependency 'eth', '~> 0.4'
  spec.add_development_dependency 'bundler', '~> 2.1.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
