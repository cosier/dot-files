#!/bin/zsh


function projects_edit(){
    if [[ -z "$1" ]]; then
        local editor="vim";
    else
        local editor=$1
    fi
    $editor ~/.dot/projects.zsh
    projects_update
}

function projects_update(){
    clr_escape "Updating Projects" $CLR_CYAN
    source ~/.dot/projects.zsh;
}


function projects(){
    local name=$1;
    local editor="/usr/local/bin/subl"
      

    if [[ -z $name ]]; then
        clr_escape "You need to specify a project name.." $CLR_RED
        return;
    fi

    case $name in
        "bk")
            $editor /apps/balaklava
        ;;

        "bkdir")
            cd /apps/balaklava
        ;;

        "bot")
            $editor /apps/bidontask
        ;;

        "botdir")
            cd /apps/bidontask;
        ;;
        
        *) clr_escape "Project not found.." $CLR_RED;;
    
    esac;

}
