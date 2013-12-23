class people::ben {
  notify { 'class people::ben declared': }

  # Clone personal dotfile repository
  repository { "${my_sourcedir}/my_dotfiles":
    source => 'phatblat/dotfiles',
  }
}
