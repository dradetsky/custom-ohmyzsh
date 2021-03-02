#!/bin/zsh

# BEGIN: i think this is redundant with oh-my-zsh

# C-s doesn't suspend
stty -ixon
# C-\ doesn't quit
stty quit undef

# END

source ~/.aliases

# BEGIN(lzs): this is my legacy zsh subconfs. May want to replace this shit
# eventually
subconfdir=~/.shell

# don't fail if we can't find anything
setopt -o nullglob

for conf in $subconfdir/*.zsh ; do
    source $conf
done

for conf in $subconfdir/*/*.zsh ; do
    source $conf
done

# but then revert to default glob behavior
setopt +o nullglob
# END(lzs)
