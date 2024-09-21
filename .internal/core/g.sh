_g_main () {
  local base=$nx_git_root
  if [[ -z "$1" ]]; then
    _g_prompt
  else
    _g_try $1
  fi
}

_g_prompt() {
  local args=""
  local n=1
  local command

  while true; do
    if [[ -z $args ]]; then
      read -e -p "g: " input
    else
      read -e -p "g: $args " input
    fi

    # if [[ -z "$input" ]]; then
    #   break
    # fi

    if [[ "$input" == "\`" ]]; then
      break
    fi

    if [[ -z $args && $input == "s" ]]; then
      args="status"
      break
    fi

    #<< append args
    if [[ -z $input ]]; then
      : # do nothin
    elif [[ "${input: -1}" == "/" ]]; then
      args="${args}${input}"
    elif [[ "${input: -1}" == "+" ]]; then
      args="${args}${input%+}"
    elif [[ -z $args ]]; then
      args="${input}"
    else
      args="${args} ${input}"
    fi
    #>>
    
    n=2
  done

  if [[ -n $args ]]; then
    command="git $args"
    $command
  fi
}

_g_try() {
  local fn=g-$1
  if [[ $(type -t $fn ) == function ]]; then
    $fn "${@:2}"
  else
    git "$@"
  fi
}
