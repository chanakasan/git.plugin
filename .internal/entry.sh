export nx_git_root=$HOME/dotfiles/plugin/git.plugin
export PATH=$nx_git_root/bin:$PATH

for f in $nx_git_root/user/alias/*.sh; do
  source $f
done
