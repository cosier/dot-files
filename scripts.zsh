#!/bin/zsh

export STP_ROOT=~/.dot/scripts

function stp(){
  stp_usage(){
    clr_brown "\n STP Console"
    clr_brown "
      [-a <arg>]

    "
  }


  # ###################################
  stp_execute_script(){
    name=$1
    file=$STP_ROOT/$name

    if [[ -f "$file" ]]; then
      clr_green "Executing STP"
      clr_blue "$file $@"
      $file $@
      echo
      return
    fi
  }
  # ###################################
  stp_create_new_script(){
    name=$1
    file=$STP_ROOT/$name

    if [[ -f "$file" ]]; then
      clr_red "STP $name already exists"
      return
    fi

    clr_green "Creating new script: \"$name\""
    vim $file
    chmod +x $file
  }

  # ###################################
  stp_delete_scripts(){
    name=$1
    file=$STP_ROOT/$name

    if [[ ! -f "$file" ]]; then
      clr_red "File: $file does not exist"
      return
    fi


    clr_red "Deleting STP Script: $name"
    read "REPLY?Are you sure? "
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      # do dangerous stuff
      rm $file
    fi
  }

  # ###################################
  stp_list_scripts(){
    clr_green "Listing Available Scripts"
    ls ~/.dot/scripts
    echo $@
  }

  local OPTIND
  while getopts "e:ac:ld:" o; do
    case "${o}" in
      e)
        stp_execute_script $OPTARG
        return
        ;;
      c)
        stp_create_new_script $OPTARG
        return
        ;;
      d)
        stp_delete_scripts $OPTARG
        return
        ;;
      l)
        stp_list_scripts
        return
        ;;
      *)
        stp_usage $o
        ;;
    esac
  done
  shift $((OPTIND-1))

}



