source $(nex _config)
export nx_git_root=$(nex _plugin git)
export PATH=$nx_git_root/bin:$PATH

for f in $nx_git_root/src/alias/*.sh; do
  source $f
done
