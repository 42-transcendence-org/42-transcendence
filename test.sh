curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
  -H 'accept: */*' \
  -H 'accept-language: fr-FR,fr;q=0.9' \
  -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozMywidXNlcm5hbWUiOiJ3aWxsIiwibmlja25hbWUiOiJvIiwic2VjcmV0Ijoicy1memVmemU3OFpBZHpkOFo3aGR6REFaYUQ4OWRkZGQiLCJleHAiOjE3MTQyMTA2ODV9.GHZfqJBcs3vhkSbAgiVPdlkiKd2hR9Cn6VHB_dS5uDI' \
  -H 'content-type: application/json' \
  -H 'cookie: csrftoken=mxzA9Fiej22K3r6iP4G7xy30tzUL8yPv; sessionid=er2o2nod8wy7i8tclmjz323k6fm1px1v' \
  -H 'origin: https://192.168.252.193:8443' \
  -H 'priority: u=1, i' \
  -H 'referer: https://192.168.252.193:8443/' \
  -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
  -H 'x-csrftoken: mxzA9Fiej22K3r6iP4G7xy30tzUL8yPv' \
  --data-raw '{"user_id":-6567890}' \
  --insecure