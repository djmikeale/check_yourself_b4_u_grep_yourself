
# give man and --help pages pretty colours
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# highlight help pages:
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
