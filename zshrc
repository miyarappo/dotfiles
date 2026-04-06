ai_commit() {
  if git diff --cached --quiet; then
    echo "No staged changes"
    return 1
  fi

  diff=$(git diff --cached | head -c 8000)

  msg=$(printf "%s" "$diff" | claude --print "
Generate a concise Git commit message in English using Conventional Commits.

Rules:
- Output only the raw commit message
- No markdown
- No backticks
- No code fences
- Exactly one line
- Imperative mood
- Maximum 72 characters
" | sed '/^```/d' | sed '/^$/d' | head -n 1)

  echo
  echo "AI suggestion:"
  echo "$msg"
  echo

  git commit -m "$msg" -e
}

# Aliases
alias g="git"
alias aws="aws auto-login --"
alias cc="claude"
alias ccr="claude --resume"
alias ccc="claude --continue"
alias ccp="claude -p"
alias aico="ai_commit"
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias md="glow -p"

# Rancher Desktop
export PATH="$HOME/.rd/bin:$PATH"

# AWSume configuration
alias awsume="source \$(which awsume)"

# Auto-Complete function for AWSume (zsh version)
_awsume() {
    local -a opts
    opts=($(awsume-autocomplete))
    _describe 'awsume' opts
}

export PATH="$HOME/.local/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$HOMEBREW_PREFIX/share/zsh-completions:$FPATH"
autoload -Uz compinit && compinit -u
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
eval "$(mise activate zsh)"
eval "$(starship init zsh)"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
