if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix.sh ]; then
  # Create a default multi-user profile if needed
  if [ ! -e "$HOME/.nix-profile" ]; then
    if [ "$(id -u)" -eq "0" ]; then
      ln -sv /nix/var/nix/profiles/default $HOME/.nix-profile
    else
      mkdir -p /nix/var/nix/profiles/per-user/$USER
      ln -sv /nix/var/nix/profiles/per-user/$USER/profile $HOME/.nix-profile
    fi
  fi

  # Source the default config
  . /nix/var/nix/profiles/default/etc/profile.d/nix.sh

  # Add some useful multi-user options
  export PATH="/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:$PATH"
  export NIX_REMOTE=daemon
fi
