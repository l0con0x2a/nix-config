# larao's dotfiles

## Setup

### Install Nix

https://nixos.org/download/

### Clone Repository

```sh
git clone git@github.com:laraochan/dotfiles.git
cd dotfiles
```

## Apply

NixOS:

```sh
sudo nixos-rebuild switch --flake .#nixos --impure
```

Home Manager:

If the `home-manager` command is not available yet, run it once with `nix run`:

```sh
nix run github:nix-community/home-manager/release-26.05 -- switch --flake .#larao
```

After the first activation, `programs.home-manager.enable = true` installs the
`home-manager` command into the user profile. Run it directly from then on:

```sh
home-manager switch --flake .#larao
```

## Update

```sh
nix flake update
```

Then run the apply command above.
