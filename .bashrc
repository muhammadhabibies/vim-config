alias gs='git status'

function log() {
  if [ $# -eq 0 ]; then
    git log --oneline --decorate --graph
  else
    git log --oneline --decorate --graph
  fi
}
