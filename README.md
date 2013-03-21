install vim and my font (liberation mono, http://www.dafont.com/liberation-mono.font) then install the config

    $ git clone --recursive https://github.com/oscarduignan/.vim.git ~/.vim

and create a link to the vimrc

on windows

    $ mklink "%HOME%\_vimrc" "%HOME%\.vim\vimrc"

on unix

    $ ln -s ~/.vimrc ~/.vimrc

and to install the dependencies

    $ gvim +BundleInstall +qall

---

To test it out without installing it you can

    $ mkdir -p /tmp/vimtest && cd /tmp/vimtest
    $ git clone --recursive https://github.com/oscarduignan/.vim.git ./.vim
    $ HOME=`pwd` gvim -u ./vim/vimrc +BundleInstall +qall
    $ HOME=`pwd` gvim -u .vim/vimrc

*NOTE*: credit goes to gmarik for this! See his config at https://github.com/gmarik/vimfiles 
