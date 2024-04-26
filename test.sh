curl 'https://192.168.252.193:8443/game/pongHistory/' \
  -H 'accept: */*' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
  -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0MCwidXNlcm5hbWUiOiJ0ZXN0XHUwMGU3XHUwMGU3byIsIm5pY2tuYW1lIjoiYWEiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDE1MDY0M30.dssjPn5l3meNC_M_QXEKbVf5VWn0Wc7EnQ7UZ6f-S6E' \
  -H 'content-type: application/json' \
  -H 'cookie: csrftoken=vnsyuy03oqVLxHM7UJ5FM16ozX6QjCIT; sessionid=kvqkbgucidu64itmjmxy7fuglkucr8n7' \
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
  -H 'x-csrftoken: vnsyuy03oqVLxHM7UJ5FM16ozX6QjCIT' \
  --data-raw '{"player1":"aa","game_type":"ai","opponent":"AI","player_score":22883828382373278378,"opponent_score":1,"winner":"AI","loser":"aa","result":"Defeat","tourney_game":true, "bad":1}' \
  --insecure


  curl 'https://192.168.252.193:8443/game/getFriendStats/' \
  -H 'accept: */*' \
  -H 'accept-language: fr-FR,fr;q=0.9' \
  -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjozMywidXNlcm5hbWUiOiJ3aWxsIiwibmlja25hbWUiOiJvIiwic2VjcmV0Ijoicy1memVmemU3OFpBZHpkOFo3aGR6REFaYUQ4OWRkZGQiLCJleHAiOjE3MTQxNTEzMjJ9.CbmoEL3AVFfybfm3gryec1LARV7AW5VQGW8OnlMZoOE' \
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
  --data-raw '{"friend_id":1}' \
  --insecure