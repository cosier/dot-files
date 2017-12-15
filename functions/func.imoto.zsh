imoto-cmd() {
  export API_URL="https://imoto.cosier.ca/api/graphql"
  export SERVER_URL="https://imoto.cosier.ca/api"

  API_URL=$API_URL \
  CLIENT_URL=$CLIENT_URL \
  SERVER_URL=$SERVER_URL \
  $@
}

imoto-frontend() {
  export APP_ENV=production
  export CLIENT_URL="https://client.imoto.cosier.ca"
  imoto-cmd npm run production-build
  imoto-cmd npm run production
}

imoto-frontend-dev() {
  export API_URL="https://imoto.cosier.ca/api/graphql"
  export SERVER_URL="https://imoto.cosier.ca/api"
  export CLIENT_URL="https://client.imoto.cosier.ca"
  export APP_ENV=development
  imoto-cmd npm run dev
}

imoto-test-availability() {
  date=$1
  default_date="17-12-2017"
  curl "https://imoto.cosier.ca/api/graphql" \
  -H "Pragma: no-cache" \
  -H "Origin: https://imoto.cosier.ca" \
  -H "Accept-Encoding: gzip, deflate, br" \
  -H "Accept-Language: en-US,en;q=0.9" \
  -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36" \
  -H "Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryArCvaILLltZzygsX" \
  -H "Accept: */*" -H "Cache-Control: no-cache" -H "Referer: https://imoto.cosier.ca/order" \
  -H "Cookie: __cfduid=d4514986f7e1e9ebd7bdb01e5ea1645081511693011; G_ENABLED_IDPS=google; remember_admin_token=W1sxXSwiJDJhJDExJDNqN2RxRVJWanRQVGxyQkt6bEhKRnUiLCIxNTEyMDc4Nzg4LjU5NjYyOCJd--d3f103ba375e8c59d5b13679fe6ff0ab1c92b34d; G_AUTHUSER_H=1; admin.id=MQ%3D%3D--4a8f3997c0b8410b536994e0585ab502288b03e6; customer.id=Ng%3D%3D--fb6908023ccd3ae804fc6153ea5f15c456749945; _imoto_session=ckJ6bEpMcUlyeU9ydWVFdVpmWHllNC9VUmpRb09mcTNqeGlhVGFKUjZQWDY1ci9RK1VoWXFuVmd0Y1ZTK1l2alBPajhsblVhdGhPV3ZqTytTbVczTUpCdUljT3R4MFZrNldDcnNVdUFrU0dXZndHWTlFa0tUcllTMlNNbmdLTGQ2ejd6MFNGaGRZSm5sVUwyckMvcytaT1JYTlA4TmZjTEQyWjZGcVNCVEFET3BlbHhsT1lXUjQ3YnlWZVJva3M2cnNrMVpvTmd0MGo2N2FxandaV1kzWmVQU2xUa3NUQVU0U1ZMSTlSUlA3dDJUK3hHZEh0ZnFTbzE3dU0weVIrTURDS0FtL0VEYisvQjZlQitlZmxvZE9xUTJvTWlNK3h0dUllQnlTbE5RVlZ4Unlyb3NLMytrWG9xN21vSE8yN2dsczZxTU8yN1hqZExxRWc0NVdLbjVHSzM4VlJTcWpoOENiUEZSekZ2amJ6cEhlMm0waFR0dndERGFVRFZ2TEdwME04emNrZDFNSWR6T3U3T2tzdXp2OWN5Y0tKK1Z2WEtGV3FzSXRiNGphY3ppRkpSRVVGL0dsQmlVNWxyYzZrNy8rdVpDQ3lFRXRRNXJVY1Y3TzRrYkE9PS0tZGtBMmZ2NjdFeHFGL1c1RkY2aWd6Zz09--76c98185e9fe2de0d4c685277475d6b3c8ea5db2" \
  -H "Connection: keep-alive" \
  --data-binary $"------WebKitFormBoundaryArCvaILLltZzygsX\r\nContent-Disposition: form-data; name='query'\r\n\r\n{\r\n  available_photographers(order_id: 100013, date: /"$date/") {\r\n    id\r\n    avatar\r\n    available_ranges\r\n    email\r\n    first_name\r\n    last_name\r\n    created_at\r\n    travel_fee\r\n    __typename\r\n  }\r\n}\r\n\r\n------WebKitFormBoundaryArCvaILLltZzygsX\r\nContent-Disposition: form-data; name=/"variables/"\r\n\r\n{}\r\n------WebKitFormBoundaryArCvaILLltZzygsX--\r\n" --compressed --insecure
}


