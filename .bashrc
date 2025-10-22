alias gs='git status'

function log() {
  if [ $# -eq 0 ]; then
    git log --oneline --decorate --graph
  else
    git log --oneline --decorate --graph
  fi
}

# Commit current work as wip so that I can switch branch
function wip {
    git add -A && git commit -m wip
}

# Reset last commit if it is a work in progress
function rwip {
   lastCommitMessage=`git log --oneline -n1 | awk '{$1= ""; print $0}'`
   lastCommitMessage=${lastCommitMessage:1:30}
   [ "$lastCommitMessage" = wip ] && git reset HEAD~1 || echo "#$lastCommitMessage#[...]" is not a wip commit
}
