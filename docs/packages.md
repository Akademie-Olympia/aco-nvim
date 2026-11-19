# Arch package and automatic updates

```bash
curl -fsSL https://raw.githubusercontent.com/Akademie-Olympia/aco-arch-dotfiles/main/install.sh | bash -s -- nvim
```

This installs `aco-arch-dotfiles-nvim`, Neovim and declared dependencies, backs up
existing settings, and activates editable user copies under `~/.config/nvim`.
Do not edit root-owned defaults under `/usr` or mix package activation with a Git
checkout in the same configuration path. Optional language tools remain opt-in.

Update with `sudo pacman -Syu`; the installed user timer synchronizes defaults,
or run `aco sync` immediately. Personal edits survive; merge `.pacnew` defaults
and reload the application. Develop in a separate checkout and push to `main`.
The registry checks sources every five minutes and publishes after passing tests;
GitHub may delay scheduled runs.

Removal: `aco-arch-dotfiles-config deactivate nvim`, then
`sudo pacman -Rns aco-arch-dotfiles-nvim`. Remove a dependent overall metapackage
first. Backups and edited user copies are retained.

[Complete installation and migration guide](https://aco-arch-dotfiles.readthedocs.io/en/latest/arch-package/) ·
[Safety and verification](https://aco-arch-dotfiles.readthedocs.io/en/latest/verification/).
For a separate standalone setup, see {doc}`installation`.
