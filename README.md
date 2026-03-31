# dotfiles

macOS 向けの個人用 dotfiles

## 含まれる設定

| ファイル / ディレクトリ | 説明 |
|---|---|
| `zshrc` | Zsh 設定 (エイリアス, mise, starship 等) |
| `zshrc.local` | マシン固有の設定 (Git 管理外) |
| `gitconfig` | Git エイリアス・設定 |
| `starship.toml` | Starship プロンプトのテーマ設定 |
| `ghostty/` | Ghostty ターミナル設定 |
| `nvim/` | Neovim 設定 (vim-plug) |

## 前提条件

- macOS
- [Homebrew](https://brew.sh)
- [Ghostty](https://ghostty.org)

以下は Homebrew 経由でインストールされます:

- [mise](https://mise.jdx.dev) — ランタイムバージョン管理
- [Starship](https://starship.rs) — シェルプロンプト
- [Neovim](https://neovim.io)

## セットアップ

```bash
git clone https://github.com/miyarappo/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

## 手動設定

- `~/.zshrc.local` にマシン固有の環境変数を記述 (Git 管理外)
- Neovim 初回起動後に `:PlugInstall` でプラグインをインストール
