#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> dotfiles setup start"

# Homebrew
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Homebrew packages
echo "==> Installing Homebrew packages..."
brew install mise starship neovim tmux gitleaks glow ripgrep zsh-autosuggestions zsh-syntax-highlighting zsh-completions
brew install --cask cmux

# Symlinks
echo "==> Creating symlinks..."

mkdir -p "$HOME/.config"

ln -sfn "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sfn "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
ln -sfn "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
ln -sfn "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
ln -sfn "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"
ln -sfn "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
ln -sfn "$DOTFILES_DIR/githooks" "$HOME/.githooks"

# Claude Code
mkdir -p "$HOME/.claude/hooks"
ln -sfn "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"
ln -sfn "$DOTFILES_DIR/claude/keybindings.json" "$HOME/.claude/keybindings.json"
ln -sfn "$DOTFILES_DIR/claude/statusline.py" "$HOME/.claude/statusline.py"
ln -sfn "$DOTFILES_DIR/claude/hooks/deny-check.sh" "$HOME/.claude/hooks/deny-check.sh"

echo "==> Done!"
echo ""
echo "Next steps:"
echo "  1. Restart your shell or run: source ~/.zshrc"
echo "  2. Open nvim (lazy.nvim will auto-install plugins on first launch)"
