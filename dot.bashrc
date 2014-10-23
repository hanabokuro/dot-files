if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f $HOME/.bash_profile ] ; then
  source $HOME/.bash_profile
fi

for F in /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash \
         /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh \
         /usr/share/doc/git-1.7.1/contrib/completion/git-completion.bash \
         /usr/share/doc/tmux-1.6/examples/bash_completion_tmux.sh \
         ; do
  if [ -f $F ] ; then
    . $F
  fi
done

export PS1='[\u@\h \W$(__git_ps1)]\$ '

alias u=pushd
alias o=popd
alias s='[ $TERM != "screen" ] && screen -D -RR'

dig() {
  TARGET=
  XOPT=

  for X in $@ ; do
    case "$X" in
      -* ) ;;
      @* ) ;;
      *  ) if [ "x$TARGET" == "x" ] ; then TARGET=$X ; fi ; break
    esac
  done

  if [[ "$TARGET" =~ "^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$" ]] ; then
    XOPT='-x'
  fi
  /usr/bin/dig $XOPT $@
}

title(){
    if [ "$1"x != "x" ] ; then
        echo "k"$1"\\"

    fi
}

alias t=title
