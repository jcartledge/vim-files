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

# launch files in vim
# support regular commands e.g. +num, +/search/
function launch_vim {
  
  if ! [ -t 0 ]; then stdin=`cat`; fi
  if [ $# -gt 0 ]; then
    if [ -n "$stdin" ]; then
      echo "$stdin" | $GUI_VIM -f --remote-silent $* - 2>/tmp/vim-error.log&
    else
      $GUI_VIM -f --remote-silent $* 2>/tmp/vim-error.log&
    fi
  elif [ ! `$GUI_VIM --serverlist` ]; then
    if [ -n "$stdin" ]; then
      echo "$stdin" | $GUI_VIM -f - 2>/tmp/vim-error.log&
    else
      $GUI_VIM -f 2>/tmp/vim-error.log&
    fi
  elif [ -n "$stdin" ]; then
    # existing instance, no additional args, input on STDIN
    $GUI_VIM --remote-send "<esc>:ene<cr>i$stdin<esc>gg"
  fi
  # TODO: gvim specific, mac-ify also
  # bring to front
  type -P wmctrl &>/dev/null && wmctrl -xa gvim.Gvim
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


# $ ls | gvim vim-aliases.sh -
# > VIM - Vi IMproved 7.2 (2008 Aug 9, compiled Sep 28 2010 07:11:04)
# > Too many edit arguments: "-"
# > More info with: "vim -h"

