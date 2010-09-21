# launch files in gvim
# support regular commands e.g. +num, +/search/
# always resuse an existing instance of gvim
# use wmctrl to bring gvim to the front
function v {
  if [ $# -gt 0 ]; then
    gvim -f --remote-silent $* 2>/tmp/vim-error.log&
  elif [ ! `gvim --serverlist` ]; then
    gvim -f 2>/tmp/vim-error.log&
  fi
  wmctrl -xa gvim.Gvim
}

# open tag definition in gvim
# always resuse an existing instance of gvim
# use wmctrl to bring gvim to the front
function vt {
  if [ `gvim --serverlist` ]; then
    gvim --remote-send "<esc>:tag $1<cr>"
  else
    gvim -t $1 2>/tmp/vim-error.log&
  fi
  wmctrl -xa gvim.Gvim
}

# open FuzzyFinderTextMate in gvim
# always resuse an existing instance of gvim
# use wmctrl to bring gvim to the front
function vf {
  if [ ! `gvim --serverlist` ]; then
    gvim 2>/tmp/vim-error.log&
  fi
  gvim --remote-send "<esc>:FuzzyFinderTextMate $1<cr>"
  wmctrl -xa gvim.Gvim
}
