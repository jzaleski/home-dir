unsetopt auto_name_dirs

PROMPT='%{$fg_bold[white]%}[%{$reset_color%}$(date +"%T")%{$fg_bold[white]%}]%{$reset_color%} %{$fg_bold[yellow]%}%# %{$fg_bold[white]%}%~/ $(git_prompt_info)%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
