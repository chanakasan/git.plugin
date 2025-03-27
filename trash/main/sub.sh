# vim:ft=sh:

g-help() {
  echo '+=================+'
  echo '| nex git.plugin  |'
  echo '+=================+'
}

g-po() {
  if [ -z "$1" ]; then
    echo "Usage: g po <branch>"
  else
    git push origin "$1"
  fi
}

g-am() {
  git commit --am $@
}

g-ir() {
  local v="$1"
  local is_num=$(_is_number $v)
  if [ -z "$v" ]; then
    git rebase -i HEAD~10
  elif [ "$is_num" = "true" ]; then
    git rebase -i HEAD~$1
  elif [ "$v" = "root" ]; then
    git rebase -i --root
  elif [ "$v" = "con" ]; then
    git rebase --continue
  elif [ "$v" = "abort" ]; then
    git rebase --abort
  else
    echo "arg must be an number"
  fi
}

g-tag() {
  git tag -a -m "$@"
}

g-cherry() {
  git cherry-pick "$@"
}

g-init() {
  git init "$@"
}

g-pom() {
  git push origin main "$@"
}

g-branch() {
  git symbolic-ref --short HEAD
}

g-example() {
  local v="$1"
  if [ -z "$v" ]; then
    git add --update .
  elif [ "$v" = "all" ]; then
    git add --all
  else
    git add "$@"
  fi
}
