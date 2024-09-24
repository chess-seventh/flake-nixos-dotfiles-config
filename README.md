# My NixOS config and dotfiles flake style

NixOS configuration files.

This is highly inspired and copied from @Misterio77 and @sjcobb2022 for their
packages. Without them I would never been able to understand and enjoy NixOS.

This will be in a perpetual WIP; let's forget about getting this into a
production-like stable state.

## Goodies you'll find here

- `nvim`: configuration fully working in a Nix way (I think...), with plugins and
  language servers.
- `zsh`: and goodies such as zoxide, all my custom aliases...
- `tmux` & `zellij`
- `mutt` (WIP)
- `and more...`

/!\ TODO /!\ Finish the list of goodies in here. /!\ TODO /!\

## Structure

- `flake.nix`: Main flake that references all host and home configurations.
Bootstrap with nix develop to add decessary packages to path for setup.
- `hosts`
  - Host configurations. Each host has a configuration file that is referenced
    in the flake.
  - Each device can opt in or out of features: such as users, home-manager, etc.
  - `common`
    - `global`: Configuration options that are shared between all hosts.
    - `optional`: Optional configuration options.
  - `slaptop`: Personal laptop config
  - `velocity`: Stripped down server configuration. Used mainly for home lab stuff.
  - `iso`: A "machine" that is used to build custom iso images.
- `home-manager`
  - `common`
    - `global`: Global home manager config
    - `optional`: Optional home manager config files
  - `sjcobb`: Personal home-manager configuration. Uses most optional configurations.
  - `guest`: Guest home-manager configuration. Quite minimal. Use for gaming as
    well, so I don't get distracted by work stuff.
- `pkgs`: Custom packages. Used to build packages that are not in nixpkgs (or
  need modification that can't be done through a overlay). Can be accessed as
  well through nix build
- `overlays`: Custom overlays. Used to add packages to nixpkgs or modify
  existing packages.
- `dotfiles`: some raw configurations that haven't been migrated yet.

## Bootstrapping

To bootstrap the system, run the following command:

```bash
nix develop
```

You should then be able to run the following command to build the system:

```bash
sudo nixos-rebuild switch --flake .#{INSERT_HOST_NAME}
```

```bash
home-manager switch --flake .#{INSERT_USER_NAME}@{INSERT_HOST_NAME}
```

### Sops & Passwords & Age

I have an Yubikey, but still haven't had the time nor the proper understanding on how to configure all my passwords, ssh-keys, gpg etc. on it.

```yaml
