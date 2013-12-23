# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.3.4"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

#github "dnsmasq",    "1.0.0"
github "foreman",    "1.0.0"
#github "gcc",        "2.0.1"
github "git",        "1.3.7"
#github "go",         "1.0.0"
github "homebrew",   "1.5.1"
github "hub",        "1.0.3"
#github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.3.0"
github "openssl",    "1.0.0"
#github "phantomjs",  "2.0.2"
#github "pkgconfig",  "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.7.2"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
#github "sudo",       "1.0.0"
github "xquartz",    "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",	     "1.3.0"
github "alfred",     "1.1.7"
github "android",    "1.1.0"
github "charles",    "1.0.2"
github "chrome",     "1.1.2"
github "divvy",      "1.0.1"
github "dropbox",    "1.2.0"
github "eclipse",    "2.2.0"
github "evernote",   "2.0.4"
github "gimp",       "1.0.0"
github "hipchat",    "1.1.0"
github "intellij",   "1.4.0"
github "istatmenus4","1.1.0"
github "java",       "1.2.0"
github "jenkins",    "0.0.7"
github "jumpcut",    "1.0.0"
github "kaleidoscope","1.0.4", :repo => "ngs/puppet-kaleidoscope"
github "omnigraffle","1.3.0"
github "onepassword","1.1.0"
github "osx",        "2.2.1"
github "skitch",     "1.0.2"
github "sparrow",    "1.0.0"
github "sublime_text_2","1.1.2"
github "things",     "1.0.1"
github "totalterminal", "1.0.0", :repo => "phatblat/puppet-totalterminal"
github "tower",      "1.0.0"
github "vmware_fusion", "1.1.0"
