function deploy-hubify(){
  git push heroku-staging master &
  git push heroku master
  git push origin master
}

function hubify-backup-s3(){
  s3cmd --recursive cp s3://assets.hubify.com s3://hubify-backups/$(date +%-m_%-d_%Y_%I_%M)/ --access_key=AKIAI5O7YU4QZ3LU3AXA --secret_key=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
}

function hubify-prod-to-dev(){
  noglob s3cmd --recursive cp s3://assets.hubify.com/* s3://dev.assets.hubify.com/ \
    --access_key=AKIAI5O7YU4QZ3LU3AXA \
    --secret_key=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
}
