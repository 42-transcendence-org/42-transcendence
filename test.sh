
  curl 'https://192.168.252.193:8443/tournament/getTournament/' \
  -H 'accept: */*' \
  -H 'accept-language: fr-FR,fr;q=0.9' \
  -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozMywidXNlcm5hbWUiOiJ3aWxsIiwibmlja25hbWUiOiJvIiwic2VjcmV0Ijoicy1memVmemU3OFpBZHpkOFo3aGR6REFaYUQ4OWRkZGQiLCJleHAiOjE3MTQyMDc1NDF9.3lEy9OehaBO_M3XhlA4B_Bhg-ZH7XDDJinE2zJYWaiU' \
  -H 'content-type: application/json' \
  -H 'cookie: csrftoken=vSbuGtS8QWq9iLn7wlUvEVbftpJEZ2YC; sessionid=5t5s0u6d73gkjtkko5s0bzosc2231w35' \
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
  -H 'x-csrftoken: vSbuGtS8QWq9iLn7wlUvEVbftpJEZ2YC' \
  --data-raw '{"tournamentOwner":"oo8392"}' \
  --insecure