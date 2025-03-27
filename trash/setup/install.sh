create_symlinks() {
  echo " => Creating symlinks"
  local root=$HOME/dotfiles/plugin/git.plugin
  local base=$root/user/config
  run_cmd ln -nfs $base/_gitconfig $HOME/.gitconfig
  run_cmd ln -nfs $base/_gitignore_global $HOME/.gitignore_global
  echo " done"
}

run_cmd() {
  local cmd="$@"
  echo " $cmd"
  $cmd
}

create_symlinks
