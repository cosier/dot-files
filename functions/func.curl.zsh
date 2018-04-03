function gocurl(){
  sh ~/.gocurl
}

function setcurl(){
  echo '#!/bin/bash' > ~/.gocurl
  echo $1 >> ~/.gocurl
}

function curl_imoto() {
  export DATA='name="query"\r\n\r\n{\r\n  content(cat: cats) {\r\n    image\r\n    __typename\r\n  }\r\n}\r\n\r\n'
  curl 'https://imoto.cosier.ca/api/graphql' -H 'Origin: http://imoto.cosier.ca' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-CA,en;q=0.9' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36' -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryHeBA4BsQKhXo89F5' -H 'Accept: */*' -H 'Referer: http://imoto.cosier.ca/' -H 'Cookie: customer.id=Mg%3D%3D--3ebef986e156f36762a04ee2feaa74a2e66a0dc6; _dabadoc_session=UjR6TDRiM2pqd2ZBdFM5dDk1Qkh1RlEvNlhzbllEbVBlR1kyQTEyd0JqWU1tWGJ0OHRWYmtuN2liSlYxbXB4N21sem9RQkxpSWlGUHNKYzZqVWxlZmJ4M1UwRlo1OW9jMUNObXh1VS85eTAxRmdZMTh0NU1jbXRaNmdPQkI1amJKVXI4Y0h1RXpaZ1dwcm1lY1U3cVZyZWEzTDkwU1N6OFVUT2ZGMXRlRWtGQ2ozZEMyZUY5MEI1a2hEdWJSVkJrLS0xNjQrZVlUVlZqTWNZLzJrL001Wk9BPT0%3D--0b3c05c4205134329dc3962cd41bfe4df254b132; ; admin.id=MQ%3D%3D--4a8f3997c0b8410b536994e0585ab502288b03e6; onetimeModalShown=true; _imoto_session=RHhSWFdPTEI5R1hRaTUzL05XS014c2RKYjAzUDI3dTlxcjI0SGxKTk1EdjFQUHBNRkRaRWJVWkFFUHZqdWlDbFV3cytKMGR1N3JVZkFuTmplNkFqL0VCVDhnMGQ0QlJiNXpSaEV3eHlVK1kxS21MODFPWWRLenU2QUZXWHlrV2grYnVrNXZraXVQZEZXSlVjdzNaendsdXlXdEJPRThDTW9OYnY1dndnSThQUEdJZDRtaVRmbkRzL3hpMTNZS24yTTdMaTdFYkE0bDlsVnFEcjl2RFJybFNLWktKRkpRaXBvUmlhRnlHQnU0QT0tLXRZdmZiYWFuandjY240MWJLY0JiM1E9PQ%3D%3D--a95e41337b52d744a009eac401569b39b5757591' -H 'Connection: keep-alive' -H 'DNT: 1' --data-binary $"------WebKitFormBoundaryHeBA4BsQKhXo89F5\r\nContent-Disposition: form-data; $DATA ------WebKitFormBoundaryHeBA4BsQKhXo89F5\r\nContent-Disposition: form-data; name="variables"\r\n\r\n{}\r\n------WebKitFormBoundaryHeBA4BsQKhXo89F5--\r\n" --compressed
}
