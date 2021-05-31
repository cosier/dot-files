function aws_frontend_instances() {
  aws_instances "type" "frontend"
}

function aws_instances() {
  aws ec2 describe-instances --region=us-west-2 --filters "Name=tag:${1},Values=${2}" --query "Reservations[*].Instances[*].PublicIpAddress" --output text
}
