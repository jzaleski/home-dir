# jzaleski - ZSH Theme (inspired by: lambda.zsh-theme)

unsetopt auto_name_dirs;

PROMPT='%(?..%{$fg[red]%}✘ )%{$reset_color%}%{$fg_bold[white]%}[%{$reset_color%}$(date +"%T")%{$fg_bold[white]%}]%{$reset_color%} %{$fg_bold[yellow]%}λ %{$fg_bold[white]%}%~/ %{$fg_bold[yellow]%}$(git_prompt_info)%{$reset_color%}';

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}";
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} ";

unset GREP_OPTIONS;
