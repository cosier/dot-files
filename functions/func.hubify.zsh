#!/bin/zsh

alias hb='hubify build'
alias h='hubify'
alias hs='hub; cd services'
alias hmrc='hs; cd mercury'
alias hdoor='hs; cd doorman'
alias hrails='hs; cd rails'
alias rails='hs; cd rails'
alias hos='hub; cd os'
alias hcd='hub; cd'

alias ssh-hubify='ssh xena@sg.hubify.com'
alias proxy-hubify='ssh xena@sg.hubify.com -D8192'
alias mosh-hubify='mosh xena@sg.hubify.com'

alias app='hubify'

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
