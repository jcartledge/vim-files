Add the following to ~/.bashrc to make files open in a new tab in the running instance of macvim or gvim:

    alias vi="mvim --remote-tab-silent"
    export EDITOR="mvim -f" # for git etc

todo:
 - html/xml lint in :make
 
what sucks:
 - can't get variables to hide in  php taglist for *.*.php
 - gvim create new file in a tab
 - gvim tab titles show nerdtree, taglist not the file being edited
 - folding doesn't do if/while etc
 
what works
what I don't know
