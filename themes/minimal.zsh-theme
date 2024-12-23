ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$fg[white]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$reset_color%} "

ZSH_THEME_SVN_PROMPT_PREFIX="$ZSH_THEME_GIT_PROMPT_PREFIX"
ZSH_THEME_SVN_PROMPT_SUFFIX="$ZSH_THEME_GIT_PROMPT_SUFFIX"
ZSH_THEME_SVN_PROMPT_DIRTY="$ZSH_THEME_GIT_PROMPT_DIRTY"
ZSH_THEME_SVN_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN"

ZSH_THEME_HG_PROMPT_PREFIX="$ZSH_THEME_GIT_PROMPT_PREFIX"
ZSH_THEME_HG_PROMPT_SUFFIX="$ZSH_THEME_GIT_PROMPT_SUFFIX"
ZSH_THEME_HG_PROMPT_DIRTY="$ZSH_THEME_GIT_PROMPT_DIRTY"
ZSH_THEME_HG_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN"

vcs_status() {
  if (( ${+functions[in_svn]} )) && in_svn; then
    svn_prompt_info
  elif (( ${+functions[in_hg]} )) && in_hg; then
    hg_prompt_info
  else
    _omz_git_prompt_info # https://github.com/ohmyzsh/ohmyzsh/issues/12328#issuecomment-2041350726
    #git_prompt_info <- old way of doing it
  fi
}

PROMPT='%2~ $(vcs_status)»%b '
