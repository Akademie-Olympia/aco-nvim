# Neovim configuration

Modular Neovim IDE with vendored plugins, native LSP integration and optional language tools. No plugin download on first start.

**[Full documentation](https://aco-nvim.readthedocs.io/en/latest/)** ·
[Arch package](https://aco-nvim.readthedocs.io/en/latest/packages/) ·
[Keymaps](https://aco-nvim.readthedocs.io/en/latest/keymaps/) ·
[Development](https://aco-nvim.readthedocs.io/en/latest/development/) ·
[Design & dependencies](https://aco-nvim.readthedocs.io/en/latest/design/)

```bash
curl -fsSL https://raw.githubusercontent.com/Akademie-Olympia/aco-arch-dotfiles/main/install.sh | bash -s -- nvim
```

Package: `aco-arch-dotfiles-nvim`. Entry point: `~/.config/nvim/init.lua`.
The manual also covers standalone installation, platforms and optional LSP/formatter/debugger tools. Diagnostics: `:NvimConfigHealth`.
Develop independently in this repository and push to `main`; after a successful registry build update with `sudo pacman -Syu`. Local builds: [PACKAGING.md](PACKAGING.md).

[![CI](https://github.com/Akademie-Olympia/aco-nvim/actions/workflows/ci.yml/badge.svg)](https://github.com/Akademie-Olympia/aco-nvim/actions/workflows/ci.yml)
[![Package safety](https://github.com/Akademie-Olympia/aco-nvim/actions/workflows/package.yml/badge.svg)](https://github.com/Akademie-Olympia/aco-nvim/actions/workflows/package.yml)

[MIT licence](LICENSE); vendored plugins keep their respective licences.
