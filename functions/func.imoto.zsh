imoto-cmd() {
  export GOOGLE_OAUTH_KEY="33745555561-4bcqte7r73kuto7f8i4ptdl4u5680spb.apps.googleusercontent.com"
  export GOOGLE_KEY_API="o1SrNafeIWCK7yzdO6ysMf83"
  export API_URL="https://imoto.cosier.ca/api/graphql"
  export SERVER_URL="https://imoto.cosier.ca/api"

  API_URL=$API_URL \
  CLIENT_URL=$CLIENT_URL \
  SERVER_URL=$SERVER_URL \
  GOOGLE_OAUTH_KEY=$GOOGLE_OAUTH_KEY \
  GOOGLE_KEY_API=$GOOGLE_KEY_API \
  $@
}

imoto-frontend() {
  export APP_ENV=production
  export CLIENT_URL="https://imoto.cosier.ca"
  imoto-cmd npm run production-build
  imoto-cmd npm run production
}

imoto-frontend-dev() {
  export CLIENT_URL="https://client.imoto.cosier.ca"
  export APP_ENV=development
  imoto-cmd npm run dev
}


