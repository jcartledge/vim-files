# a set of aliases for launching gvim
#
# open in an existing instance
# bring gvim to the front
# launch gvim with a tty

# launch files in gvim
# support regular commands e.g. +num, +/search/
function v {
  if [ $# -gt 0 ]; then
    gvim -f --remote-silent $* 2>/tmp/vim-error.log&
  elif [ ! `gvim --serverlist` ]; then
    gvim -f 2>/tmp/vim-error.log&
  fi
  wmctrl -xa gvim.Gvim
}

# open tag definition in gvim
function vt {
  if [ `gvim --serverlist` ]; then
    gvim --remote-send "<esc>:tag $1<cr>"
  else
    gvim -t $1 2>/tmp/vim-error.log&
  fi
  wmctrl -xa gvim.Gvim
}

# open FuzzyFinderTextMate in gvim
function vf {
  if [ ! `gvim --serverlist` ]; then
    gvim -f 2>/tmp/vim-error.log&
    sleep 1
  fi
  gvim --remote-send "<esc>:FuzzyFinderTextMate $1<cr>"
  wmctrl -xa gvim.Gvim
}
