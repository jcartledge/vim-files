Something about this puts regular vim 7 on mac into blinking green mode.
I don't care to fix this, I'll just use macvim instead.

Add this to ~/.bashrc to make files open in a new tab in the running instance of macvim:

    alias vi="mvim --remote-tab-silent"
    export EDITOR="mvim -f" # for git etc

General issues:

 - define an alias like the above for CLI vim (or gvim)

 - apostrophes in markdown

possible problem with F2 mapping in linux


