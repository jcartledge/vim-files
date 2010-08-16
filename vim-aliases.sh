# launch files in gvim
# support regular commands e.g. +num, +/search/
# always resuse an existing instance of gvim
# use wmctrl to bring gvim to the front
function v {
  if [ $# -gt 0 ]; then
    gvim --remote-silent $*
  elif [ ! `gvim --serverlist` ]; then
    gvim
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
    gvim -t $1
  fi
  wmctrl -xa gvim.Gvim
}

# open FuzzyFinderTextMate in gvim
# always resuse an existing instance of gvim
# use wmctrl to bring gvim to the front
function vf {
  if [ ! `gvim --serverlist` ]; then
    gvim
  fi
  gvim --remote-send "<esc>:FuzzyFinderTextMate $1<cr>"
  wmctrl -xa gvim.Gvim
}
