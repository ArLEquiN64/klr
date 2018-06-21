# vim: ft=zsh


# Define prompts.
#PROMPT='${SSH_TTY:+"%F{9}%n%f%F{7}@%f%F{3}%m%f "}%F{4}${_prompt_sorin_pwd}%(!. %B%F{1}#%f%b.)${editor_info[keymap]} '
#RPROMPT='$python_info[virtualenv]${editor_info[overwrite]}%(?:: %F{1}'
#RPROMPT+=${show_return}
#RPROMPT+='%f)${VIM:+" %B%F{6}V%f%b"}${_prompt_sorin_git}'
#SPROMPT='zsh: correct %F{1}%R%f to %F{2}%r%f [nyae]? '


for f in "${${(%):-%N}:A:h}"/modules/**/*.(|z)sh(N-.)
do
    source "$f"
done
unset f

# Exposes information about the Zsh Line Editor via the $editor_info associative
# array.
function editor-info {
  # Clean up previous $editor_info.
  unset editor_info
  typeset -gA editor_info

  if [[ "$KEYMAP" == 'vicmd' ]]; then
    zstyle -s ':prezto:module:editor:info:keymap:alternate' format 'REPLY'
    editor_info[keymap]="$REPLY"
  else
    zstyle -s ':prezto:module:editor:info:keymap:primary' format 'REPLY'
    editor_info[keymap]="$REPLY"

    if [[ "$ZLE_STATE" == *overwrite* ]]; then
      zstyle -s ':prezto:module:editor:info:keymap:primary:overwrite' format 'REPLY'
      editor_info[overwrite]="$REPLY"
    else
      zstyle -s ':prezto:module:editor:info:keymap:primary:insert' format 'REPLY'
      editor_info[overwrite]="$REPLY"
    fi
  fi

  unset REPLY
  zle zle-reset-prompt
}
zle -N editor-info

# Set editor-info parameters.
zstyle ':prezto:module:editor:info:completing' format '%B%F{7}...%f%b'
zstyle ':prezto:module:editor:info:keymap:primary' format ' %B%F{1}❯%F{3}❯%F{2}❯%f%b'
zstyle ':prezto:module:editor:info:keymap:primary:overwrite' format ' %F{3}♺%f'
zstyle ':prezto:module:editor:info:keymap:alternate' format ' %B%F{2}❮%F{3}❮%F{1}❮%f%b'



#myprompt+='$(__klr::prompt::path)'
myprompt+='%F{4}$(prompt-pwd)%(!. %B%F{1}#%f%b.)${editor_info[keymap]}%f'

myprompt2+='$(__klr::prompt::hostname)'
myprompt2+='$(__klr::prompt::user)'
#myprompt+='$(__klr::prompt::job)'
#myprompt+='$(__klr::prompt::vimode)'
myprompt2+='$(__klr::prompt::status)'
myprompt2+=' '
__klr::indicator::vim_mode $myprompt $myprompt2

#RPROMPT+='$(__klr::prompt::exit_code)'
#RPROMPT+='$(__klr::prompt::git)'
RPROMPT+='$python_info[virtualenv]${editor_info[overwrite]}%(?:: %F{1}'
RPROMPT+=${show_return}
RPROMPT+='%f)${VIM:+" %B%F{6}V%f%b"}${_prompt_sorin_git}'

#SPROMPT+='zsh: correct %F{1}%R%f to %F{2}%r%f [nyae]? '
SPROMPT+='$(__klr::prompt::correct)'

