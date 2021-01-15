#!/bin/zsh

function conda-setup(){
  MINICONDA="${HOME}/.miniconda"
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$(\"${MINICONDA}/bin/conda\" 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "${MINICONDA}/etc/profile.d/conda.sh" ]; then
          . "${MINICONDA}/etc/profile.d/conda.sh"
      else
          export PATH="${MINICONDA}/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
}
