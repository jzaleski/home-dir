# jzaleski - ZSH Theme (inspired by: lambda.zsh-theme)

unsetopt auto_name_dirs;
unsetopt pushd_ignore_dups;

PROMPT='%{$fg_bold[red]%}$(error_prompt_info)%{$reset_color%}$(environment_prompt_info)%{$fg_bold[white]%}[%{$reset_color%}$(date +"%T")%{$fg_bold[white]%}]%{$reset_color%} %{$fg_bold[green]%}{%{$reset_color%}%{$fg_bold[white]%}$(hostname_prompt_info)%{$reset_color%}%{$fg_bold[green]%}}%{$reset_color%} %{$fg_bold[yellow]%}> %{$fg_bold[white]%}%~/ %{$fg_bold[yellow]%}$(git_prompt_info)%{$reset_color%}';

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}";
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} ";

unset GREP_COLOR;
unset GREP_OPTIONS;
unset LSCOLORS;
