


function deploy-hubify(){
  git push origin master:master
  deploy-hubify-staging
  deploy-hubify-production
}

function deploy-hubify-staging(){
  git checkout staging
  git merge master
  git push origin staging:staging
}

function deploy-hubify-production(){
  git checkout production
  git merge master
  git push origin production:production
}

function hubify-backup-s3(){
  s3cmd --recursive cp s3://assets.hubify.com s3://hubify-backups/$(date +%-m_%-d_%Y_%I_%M)/ --access_key=AKIAI5O7YU4QZ3LU3AXA --secret_key=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
}

function hubify-prod-to-dev(){
  s3cmd --recursive cp s3://assets.hubify.com/ s3://dev.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
}

function hubify-up(){
  git push origin master:master &
  git push origin staging:staging &
  git push origin production:production
}

alias hup='hubify-up'
alias hca='rake assets:precompile'
alias deploy='deploy-hubify'
alias dstage='deploy-hubify-staging'
alias dprod='deploy-hubify-production'

alias hssh='ssh ubuntu@ec2.hubify.com -v -i ~/.ssh/hubify_v2_dev.pem'
alias mhssh='mosh bailey@ec2.hubify.com'
