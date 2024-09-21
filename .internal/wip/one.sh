_g_prompt() {
  local args=""
  local n=1
  local input
  local key1 key2
  
  while true; do
    # Prompt for input based on existing args
    if [[ -z $args ]]; then
      echo -n "g: "
    else
      echo -n "g: $args "
    fi
    
    # Read input one character at a time to detect Ctrl+Enter (Ctrl is 13 in ASCII)
    input=""
    while IFS= read -rsn1 key1; do
      if [[ $key1 == $'\x0A' && $key2 == $'\x0D' ]]; then  # Ctrl+Enter detection
        break 2  # Break out of both loops
      elif [[ $key1 == $'\x0A' ]]; then  # Enter key (new line)
        break  # Break from inner loop, go back to main loop
      fi
      input+="$key1"  # Append each typed character to the input
      key2="$key1"  # Track last key pressed
    done
    
    if [[ $n == 1 && $input == "s" ]]; then
      args="status"
      break
    fi

    # Append args logic
    if [[ -z $input ]]; then
      : # do nothing
    elif [[ "${input: -1}" == "/" ]]; then
      args="${args}${input}"
    elif [[ "${input: -1}" == "+" ]]; then
      args="${args}${input%+}"
    elif [[ -z $args ]]; then
      args="${input}"
    else
      args="${args} ${input}"
    fi
    
    n=2
  done
}
