require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx
  include xquartz

include adium
include alfred
include android::sdk
include android::tools
include charles
include chrome
include divvy
include dropbox
include chrome
include eclipse::java
include evernote
include gimp
include hipchat
include intellij
include istatmenus4
include java
include jenkins
include jumpcut
include omnigraffle
include onepassword
include skitch
include sparrow
include sublime_text_2
sublime_text_2::package { 'Emmet':
  source => 'sergeche/emmet-sublime'
}
include things
#include totalterminal

# OS X defaults - https://github.com/boxen/puppet-osx
# include osx::recovery_message { 'If this Mac is found, please call 720-213-8856': }
# include osx::global::disable_key_press_and_hold
include osx::global::enable_keyboard_control_access
include osx::global::expand_print_dialog
include osx::global::expand_save_dialog
# include osx::global::disable_key_press_and_hold
# include osx::global::disable_key_press_and_hold
include osx::global::enable_keyboard_control_access
include osx::global::expand_print_dialog
include osx::global::expand_save_dialog
# include osx::global::disable_key_press_and_hold
include osx::global::enable_keyboard_control_access
include osx::global::expand_print_dialog
include osx::global::expand_save_dialog
include osx::global::disable_remote_control_ir_receiver
include osx::global::disable_autocorrect
# include osx::dock::2d
include osx::dock::autohide
include osx::dock::clear_dock
# include osx::dock::disable
include osx::dock::dim_hidden_apps
# include osx::dock::hide_indicator_lights
# include osx::finder::show_hard_drives_on_desktop
include osx::finder::show_external_hard_drives_on_desktop
include osx::finder::show_removable_media_on_desktop
# include osx::finder::show_all_on_desktop # does all of the above
# include osx::finder::empty_trash_securely # enable Secure Empty Trash
include osx::finder::unhide_library # unsets the hidden flag on ~/Library
# include osx::finder::show_hidden_files
include osx::finder::enable_quicklook_text_selection
include osx::universal_access::ctrl_mod_zoom
include osx::universal_access::enable_scrollwheel_zoom
include osx::disable_app_quarantine # disable the downloaded app quarantine
include osx::no_network_dsstores # disable creation of .DS_Store files on network shares
include osx::software_update # download and install software updates
# Set the default value (35)
include osx::global::key_repeat_delay
#class { 'osx::global::key_repeat_delay':
#  rate => 10
#}
# Set the default value (0)
include osx::global::key_repeat_rate
#class { 'osx::global::key_repeat_rate':
#  rate => 2
#}

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::v0_6
  include nodejs::v0_8
  include nodejs::v0_10

  # default ruby versions
  include ruby::1_8_7
  include ruby::1_9_2
  include ruby::1_9_3
  include ruby::2_0_0

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
