#!/bin/zsh


function deploy-hubify(){
  git push github master:master
  deploy-hubify-staging
  deploy-hubify-production
}

function deploy-hubify-staging(){
  git checkout staging
  git merge master
  git push github staging:staging
}

function deploy-hubify-production(){
  git checkout production
  git merge master
  git push github production:production
}


function hubify-up(){
  git push github master:master &
  git push github staging:staging &
  git push github production:production
}

function hubify-staging-migrate(){
  RAILS_ENV=production DATABASE_URL="postgres://docker:michigan!\$007@db.hubify-staging.hubify.svc.tutum.io:5432/postgres" rake db:migrate
}
function hubify-production-migrate(){
  RAILS_ENV=production DATABASE_URL="postgres://docker:michigan!\$007@db.hubify-production.hubify.svc.tutum.io:5432/postgres" rake db:migrate
}

function hubify-dev-db(){
  port=$1
  host=$2
  if [ -z "$port" ]; then
    port='5432'
  fi
  if [ -z "$host" ]; then
    host='172.17.2.0'
  fi

  DATABASE_URL="postgres://docker:michigan!\$007@$host:$port/postgres"
  echo "DATABASE_URL=$DATABASE_URL"
  export DATABASE_URL=$DATABASE_URL
}

function hubify-dev-console(){
  port=$1
  if [ -z "$port" ]; then
    port='5432'
  fi
  DATABASE_URL="postgres://docker:michigan!\$007@localhost:$port/postgres"
  echo "DATABASE_URL=$DATABASE_URL"
  DATABASE_URL=$DATABASE_URL rails console
}

function hubify-staging-console(){
  DATABASE_URL="postgres://docker:michigan!\$007@db.hubify-staging.hubify.svc.tutum.io:5432/postgres"
  echo "DATABASE_URL=$DATABASE_URL"
  DATABASE_URL=$DATABASE_URL rails console
}

function hubify-production-console(){
  DATABASE_URL="postgres://docker:michigan!\$007@db.hubify-production.hubify.svc.tutum.io:5432/postgres"
  echo "DATABASE_URL=$DATABASE_URL"
  DATABASE_URL=$DATABASE_URL rails console
}

alias hup='hubify-up'
alias hca='RAILS_ENV=production rake assets:precompile'
alias deploy='deploy-hubify'
alias dstage='deploy-hubify-staging'
alias dprod='deploy-hubify-production'

alias hssh='ssh ubuntu@dx.hubify.com -v -i ~/.ssh/hubify_v2_dev.pem'
alias mhssh='mosh bailey@dx.hubify.com'
alias ssh-hubify-spot='ssh -i ~/.ssh/hubify_dev_workloads.pem ubuntu@spot.hubify.com'
alias mosh-hubify-spot='LC_ALL=C.UTF-8 mosh --server="LANG=C.UTF-8 mosh-server" bailey@spot.hubify.com'

alias unicorn-restart='sudo kill -USR2 $(ps aux | grep unicorn | grep master | awk '{ print $2 }')'




#####################################
# S3 Backups commands
function hubify-backup-s3(){
  s3cmd --recursive cp s3://assets.hubify.com s3://backups.hubify.com/$(date +%-m_%-d_%Y_%I_%M)/ --access_key=AKIAI5O7YU4QZ3LU3AXA --secret_key=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
}

function hubify-backup-s3-no-creds(){
  s3cmd --recursive cp s3://assets.hubify.com s3://hubify-backups/$(date +%-m_%-d_%Y_%I_%M)/
}

function hubify-s3-prod-to-dev(){
  s3cmd --recursive cp s3://assets.hubify.com/listings s3://dev.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/images s3://dev.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/hubs s3://dev.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/users s3://dev.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/categories s3://dev.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/skills s3://dev.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/attached_files s3://dev.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
}

function hubify-s3-prod-to-staging(){
  s3cmd --recursive cp s3://assets.hubify.com/listings s3://staging.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/images s3://staging.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/hubs s3://staging.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/users s3://staging.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/categories s3://staging.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/skills s3://staging.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
  s3cmd --recursive cp s3://assets.hubify.com/attached_files s3://staging.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
}

function hubify-prod-to-dev(){
  s3cmd --recursive cp s3://assets.hubify.com/ s3://dev.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
}
