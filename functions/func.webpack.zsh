function webpack-lensculture() {
  bin/webpack-dev-server --key /etc/nginx/certs/dev.lensculture.com/key.pem --cert /etc/nginx/certs/dev.lensculture.com/cert.pem
}
function webpack-os() {
  bin/webpack-dev-server --key /etc/nginx/certs/dev.openstudios.in/privkey1.pem --cert /etc/nginx/certs/dev.openstudios.in/fullchain1.pem
}
