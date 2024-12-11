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

g-add() {
  local v="$1"
  if [ -z "$v" ]; then
    git add --update .
  elif [ "$v" = "all" ]; then
    git add --all
  else
    git add "$@"
  fi
}

g-amend() {
  git commit -v --amend "$@"
}

g-show() {
  git show "$@"
}

# commit start
g-temp() {
  git commit -m "TEMP" "$@"
}

g-minor() {
  git commit -m "minor fix" "$@"
}

g-check() {
  git commit -m "checkpoint" "$@"
}

g-trivial() {
  git commit -m "trivial" "$@"
}

g-wip() {
  git commit -m "wip" "$@"
}

g-rev() {
  if [[ -z "$1" || $1 == "-a" ]]; then
    git commit -m "rev" "$@"
  else
    git commit -m "rev $1" "${@:2}"
  fi
}

g-first() {
  git commit -m "first" "$@"
}

g-reset() {
  if [ "$1" == "last" ]; then
    git reset HEAD~1 ${@:2}
  elif [ "$1" == "head" ]; then
    git reset HEAD~$2 ${@:3}
  else 
    git reset "$@"
  fi
}

g-co() {
  git checkout "$@"
}

g-lg() {
  local v="$1"
  local is_num=$(_nx_is_number $v)
  if [ -z "$v" ]; then
    git log -5
  elif [ "$is_num" = "true" ]; then
    git log -$v
  else
    git log "$@"
  fi
}

g-dc() {
  git diff --cached "$@"
}

g-count() {
  git rev-list HEAD --count
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
