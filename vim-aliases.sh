# a set of aliases for launching gui vim
#
# open in an existing instance
# bring vim to the front
# handle STDIN from pipe
# launch vim with a tty

# first make sure we have a vim
type -P mvim &>/dev/null && GUI_VIM=mvim
type -P gvim &>/dev/null && GUI_VIM=gvim
if [ ! $GUI_VIM ]; then echo "No GUI Vim available, can't install aliases."&>2; exit 1; fi

function launch_vim {

  existing_vim=0; if [ -n `$GUI_VIM --serverlist` ]; then existing_vim=1; fi
  pipe_supplied=0; if [ ! -t 0 ]; then pipe_supplied=1; fi
  args_supplied=0; if [ $# -ne 0 ]; then args_supplied=1; fi

  if [ $existing_vim -ne 1 ] && [ $args_supplied -ne 1 ] && [ $pipe_supplied -ne 1 ]; then
    echo "0"
    start_vim
    bring_vim_to_front
  elif [ $existing_vim -ne 1 ] && [ $args_supplied -ne 1 ] && [ $pipe_supplied -eq 1 ]; then
    echo "1"
    start_vim
    bring_vim_to_front
    pipe_stdin_to_vim
  elif [ $existing_vim -ne 1 ] && [ $args_supplied -eq 1 ] && [ $pipe_supplied -ne 1 ]; then
    echo "2"
    call_vim_with_args $*
    bring_vim_to_front
  elif [ $existing_vim -ne 1 ] && [ $args_supplied -eq 1 ] && [ $pipe_supplied -eq 1 ]; then
    echo "3"
    call_vim_with_args $*
    bring_vim_to_front
    pipe_stdin_to_vim
  elif [ $existing_vim -eq 1 ] && [ $args_supplied -ne 1 ] && [ $pipe_supplied -ne 1 ]; then
    echo "4"
    bring_vim_to_front
  elif [ $existing_vim -eq 1 ] && [ $args_supplied -ne 1 ] && [ $pipe_supplied -eq 1 ]; then
    echo "5"
    bring_vim_to_front
    new_buffer_vim
    pipe_stdin_to_vim
  elif [ $existing_vim -eq 1 ] && [ $args_supplied -eq 1 ] && [ $pipe_supplied -ne 1 ]; then
    echo "6"
    bring_vim_to_front
    call_vim_with_args $*
  elif [ $existing_vim -eq 1 ] && [ $args_supplied -eq 1 ] && [ $pipe_supplied -eq 1 ]; then
    echo "7"
    bring_vim_to_front
    call_vim_with_args $*
    new_buffer_vim
    pipe_stdin_to_vim
  fi
}

function start_vim {
  echo "starting $GUI_VIM"
  $GUI_VIM -f 2>/tmp/vim-error.log&
}

function call_vim_with_args {
  echo "calling $GUI_VIM with args: $*"
  $GUI_VIM -f --remote-silent $* 2>/tmp/vim-error.log&
}

function bring_vim_to_front {
  echo "bringing $GUI_VIM to front"
  type -P wmctrl &>/dev/null && wmctrl -xa gvim.Gvim
}

function new_buffer_vim {
  "opening new buffer in $GUI_VIM"
  $GUI_VIM --remote-send "<esc>:ene<cr>"
}

function pipe_stdin_to_vim {
  echo "piping STDIN to $GUI_VIM"
  while read stdin
  do
    $GUI_VIM --remote-send "<esc>Gi$stdin<cr><esc>"
  done
}

# open tag definition in vim
function launch_vim_tag {
  if [ `$GUI_VIM --serverlist` ]; then
    $GUI_VIM --remote-send "<esc>:tag $1<cr>"
  else
    $GUI_VIM -t $1 2>/tmp/vim-error.log&
  fi
  type -P wmctrl &>/dev/null && wmctrl -xa gvim.Gvim
}

alias v=launch_vim
alias t=launch_vim_tag

