# an alias for launching gui vim
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

  if [ $existing_vim -ne 1 ]; then
    if [ $args_supplied -eq 1 ]; then start_vim_with_args $* else; start_vim; fi
    bring_vim_to_front
    if [ $pipe_supplied -eq 1 ]; then pipe_stdin_to_vim; fi
  else
    bring_vim_to_front
    if [ $args_supplied -eq 1 ]; then call_vim_with_args $*; fi
    if [ $pipe_supplied -eq 1 ]; then new_buffer_vim; pipe_stdin_to_vim; fi
  fi
}

function start_vim {
  echo "Starting $GUI_VIM"
  $GUI_VIM -f 2>/tmp/vim-error.log&
}

function call_vim_with_args {
  echo "Calling $GUI_VIM with args: $*"
  $GUI_VIM -f --remote-silent $* 2>/tmp/vim-error.log&
}

function bring_vim_to_front {
  # FIXME only works when wmctrl is present
  echo "Bringing $GUI_VIM to front"
  type -P wmctrl &>/dev/null && wmctrl -xa gvim.Gvim
}

function new_buffer_vim {
  "Opening new buffer in $GUI_VIM"
  $GUI_VIM --remote-send "<esc>:ene<cr>"
}

function pipe_stdin_to_vim {
  echo "Piping STDIN to $GUI_VIM"
  while read stdin
  do
    $GUI_VIM --remote-send "<esc>Gi$stdin<cr><esc>"
  done
}

alias v=launch_vim
