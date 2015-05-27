if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix.sh ]; then
  # Source the default config
  . /nix/var/nix/profiles/default/etc/profile.d/nix.sh

  # Add some useful multi-user options
  export PATH="/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:$PATH"
  export NIX_REMOTE=daemon
fi
