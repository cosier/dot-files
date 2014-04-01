#!/bin/zsh

#####################################
# Nginx Management

function nginx_enable(){
    nginx_dir=/usr/local/nginx/conf;
    if [ -f $nginx_dir/sites-available/$1.conf ]; then
        ln -sf $nginx_dir/sites-available/$1.conf $nginx_dir/sites-enabled/$1.conf;
    else;
        echo -e "$nginx_dir/sites-available/$1.conf NOT FOUND"
        echo -e "Cannot Enable $1"; 
    fi;
}

function nginx_disable(){
    nginx_dir=/usr/local/nginx/conf;
    
    if [ -f $nginx_dir/sites-available/$1.conf ]; then
        rm $nginx_dir/sites-enabled/$1.conf
    else
        echo -e "$nginx_dir/sites-available/$1.conf NOT FOUND"
        echo -e "Unable to delete";
    fi

    
}
