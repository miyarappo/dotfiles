# Node.jsのパス
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# alias
alias ubuntu="docker run -it --rm ubuntu:16.04 bash"

# peco-tree-dir-change
peco-tree-dir-change () {

search_ignore_pattern=".git|.bin|.DS_Store|.atom|.npm|elm-stuff|.dropbox|node_modules|*.svg|*.png|*.jpg|*.jpeg"

search_trees=$(tree --charset=o -f -a -d -I "${search_ignore_pattern}" | peco --initial-filter "Fuzzy"| tr -d '\||`| '| sed -E 's/^\-+//g')

  if [ -n "${search_trees}" ]; then
    cd "${search_trees}"
    pwd
    ls
  fi

}

bind -x '"\C-t": peco-tree-dir-change'

source ~/git-completion.bash
source ~/google-cloud-sdk/completion.bash.inc
source ~/google-cloud-sdk/path.bash.inc
eval "$(direnv hook bash)"
source <(kubectl completion bash)
