# #login
#   curl 'https://192.168.252.193:8443/auth/login/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"username":".","password":"\t"}' \
#   --insecure
# #register
#   curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   --data-raw '{"username":"koko","password1":"kirua&will","password2":"kirua&will","email":"koko@k","first_namee":"koko"}' \
#   --insecure

# #password
#   curl 'https://192.168.252.193:8443/auth/password/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"password":None, "u":"a"}' \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/chatgpt/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzMzAxfQ.RKUztd6qfoU33E_7bHu714S53265WEC9lC8jRv8EChQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"question":"fess"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/c2fffa40-aa9b-4d6b-815e-a1fcb3fd1c8a/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNTEyfQ.Oe8yhKz6vhNjmfF_-p09VCDJY9OvE5GGQxYrJygf_NQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNjQzfQ.8_296s468JEVH94-c0Gf-B1zU6tZ5jt3G0Ga4nro4yw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"player1":"wruet-su@42","game_type":"local","opponent":"Player 2","player_score":5,"opponent_score":3,"winner":"wruet-su@42","loser":"Player 2","result":"Victory","tourney_game":false}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0Mjc2fQ.gTDEUpbeTqHfYL7fJdvAGwz96MeOGPEiytr1gGUkGCk' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"friend_id":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0NTc0fQ.EVRuDItXMkRxmlq6gRio-cfEJLCyxMmhnVaiQER11Ns' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/saveTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MDE2fQ.Xn-bUCX99V_NbLcDrXannyPjAM-bEFJYdain2R_ADQQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwner":"wruet-su@42","Lang":"en","player1":"k","plar2":"a","player3":"l","player4":"wruet-su@42","game1_winner":"k","game1_loser":"a","game2_winner":"l","game2_loser":"wruet-su@42","game3_winner":"l","game3_loser":"k","game1_player1_score":1,"game1_player2_score":0,"game2_player1_score":0,"game2_player2_score":1,"game3_player1_score":0,"game3_player2_score":1}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MjQwfQ.hidEIhVAvWXPJfL5J44tja-lHsiGYcWrnoDl40rLa0A' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwnr":1, "test":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/9eba1b79-f3bb-413f-b378-efe52dee48e5/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1Nzk2fQ.h-Estg88OJJxy5nB457juL-FiBn0AkpGq8GNR28hzUg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw null \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/SaveLanguage/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMwODY5fQ.7XSBD3vLtsH05oy8IxJdTySaUEguYZznelCKNruKOQI' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw 1 \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/getInfo/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg2fQ.b8IHuyg60HE4Y8iGZ13uZQFRKgEjRU8F2ZBRib_evgs' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg4fQ.YzJB1JU0DjzmWXRsxMP9_O9V35L2NdgIb7PKKx-d384' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --data-raw None \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   --data-raw '{"username":"test","password1":"kirua&will","password2":"kirua&will","email":"tt@tt","first_name":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/DeleteFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyMzcxfQ.w6ylgf-YZcBEkK6mScPKFjh4yQae2YQSvbVYFiOY7R0' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/FriendRequests/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMjQzNX0.ptrdnoBG59D_9_nw_Q69rE3YXXI7PEmiGbkv56ddJtQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/RefuseFriendRequest/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzA1Mn0.V6t2funirWGa6GOAXJooP6_Ir4A2gUIutsp4ATha-70' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"wruet-su@42"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/createJankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzMzYxfQ.TBGBxpUVFBgM-kK4nBc62mVL0gwMcizlEq8AGQLSDYw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"user_id":"cc"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/getResults/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNTY5fQ.-KOyUgWvQql-5KDGPBNzdrwyAmH4vq2RwRatYPELtlc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2N30.rTrMSbr01aivBh1Kdo88On8V0siJopZMgOyFnQBq98o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure


#   #login
#   curl 'https://192.168.252.193:8443/auth/login/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"username":".","password":"\t"}' \
#   --insecure
# #register
#   curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   --data-raw '{"username":"koko","password1":"kirua&will","password2":"kirua&will","email":"koko@k","first_namee":"koko"}' \
#   --insecure

# #password
#   curl 'https://192.168.252.193:8443/auth/password/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"password":None, "u":"a"}' \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/chatgpt/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzMzAxfQ.RKUztd6qfoU33E_7bHu714S53265WEC9lC8jRv8EChQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"question":"fess"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/c2fffa40-aa9b-4d6b-815e-a1fcb3fd1c8a/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNTEyfQ.Oe8yhKz6vhNjmfF_-p09VCDJY9OvE5GGQxYrJygf_NQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNjQzfQ.8_296s468JEVH94-c0Gf-B1zU6tZ5jt3G0Ga4nro4yw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"player1":"wruet-su@42","game_type":"local","opponent":"Player 2","player_score":5,"opponent_score":3,"winner":"wruet-su@42","loser":"Player 2","result":"Victory","tourney_game":false}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0Mjc2fQ.gTDEUpbeTqHfYL7fJdvAGwz96MeOGPEiytr1gGUkGCk' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"friend_id":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0NTc0fQ.EVRuDItXMkRxmlq6gRio-cfEJLCyxMmhnVaiQER11Ns' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/saveTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MDE2fQ.Xn-bUCX99V_NbLcDrXannyPjAM-bEFJYdain2R_ADQQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwner":"wruet-su@42","Lang":"en","player1":"k","plar2":"a","player3":"l","player4":"wruet-su@42","game1_winner":"k","game1_loser":"a","game2_winner":"l","game2_loser":"wruet-su@42","game3_winner":"l","game3_loser":"k","game1_player1_score":1,"game1_player2_score":0,"game2_player1_score":0,"game2_player2_score":1,"game3_player1_score":0,"game3_player2_score":1}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MjQwfQ.hidEIhVAvWXPJfL5J44tja-lHsiGYcWrnoDl40rLa0A' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwnr":1, "test":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/9eba1b79-f3bb-413f-b378-efe52dee48e5/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1Nzk2fQ.h-Estg88OJJxy5nB457juL-FiBn0AkpGq8GNR28hzUg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw null \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/SaveLanguage/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMwODY5fQ.7XSBD3vLtsH05oy8IxJdTySaUEguYZznelCKNruKOQI' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw 1 \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/getInfo/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg2fQ.b8IHuyg60HE4Y8iGZ13uZQFRKgEjRU8F2ZBRib_evgs' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg4fQ.YzJB1JU0DjzmWXRsxMP9_O9V35L2NdgIb7PKKx-d384' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --data-raw None \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   --data-raw '{"username":"test","password1":"kirua&will","password2":"kirua&will","email":"tt@tt","first_name":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/DeleteFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyMzcxfQ.w6ylgf-YZcBEkK6mScPKFjh4yQae2YQSvbVYFiOY7R0' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/FriendRequests/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMjQzNX0.ptrdnoBG59D_9_nw_Q69rE3YXXI7PEmiGbkv56ddJtQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/RefuseFriendRequest/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzA1Mn0.V6t2funirWGa6GOAXJooP6_Ir4A2gUIutsp4ATha-70' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"wruet-su@42"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/createJankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzMzYxfQ.TBGBxpUVFBgM-kK4nBc62mVL0gwMcizlEq8AGQLSDYw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"user_id":"cc"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/getResults/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNTY5fQ.-KOyUgWvQql-5KDGPBNzdrwyAmH4vq2RwRatYPELtlc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2N30.rTrMSbr01aivBh1Kdo88On8V0siJopZMgOyFnQBq98o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure


#   #login
#   curl 'https://192.168.252.193:8443/auth/login/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"username":".","password":"\t"}' \
#   --insecure
# #register
#   curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   --data-raw '{"username":"koko","password1":"kirua&will","password2":"kirua&will","email":"koko@k","first_namee":"koko"}' \
#   --insecure

# #password
#   curl 'https://192.168.252.193:8443/auth/password/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"password":None, "u":"a"}' \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/chatgpt/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzMzAxfQ.RKUztd6qfoU33E_7bHu714S53265WEC9lC8jRv8EChQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"question":"fess"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/c2fffa40-aa9b-4d6b-815e-a1fcb3fd1c8a/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNTEyfQ.Oe8yhKz6vhNjmfF_-p09VCDJY9OvE5GGQxYrJygf_NQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNjQzfQ.8_296s468JEVH94-c0Gf-B1zU6tZ5jt3G0Ga4nro4yw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"player1":"wruet-su@42","game_type":"local","opponent":"Player 2","player_score":5,"opponent_score":3,"winner":"wruet-su@42","loser":"Player 2","result":"Victory","tourney_game":false}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0Mjc2fQ.gTDEUpbeTqHfYL7fJdvAGwz96MeOGPEiytr1gGUkGCk' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"friend_id":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0NTc0fQ.EVRuDItXMkRxmlq6gRio-cfEJLCyxMmhnVaiQER11Ns' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/saveTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MDE2fQ.Xn-bUCX99V_NbLcDrXannyPjAM-bEFJYdain2R_ADQQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwner":"wruet-su@42","Lang":"en","player1":"k","plar2":"a","player3":"l","player4":"wruet-su@42","game1_winner":"k","game1_loser":"a","game2_winner":"l","game2_loser":"wruet-su@42","game3_winner":"l","game3_loser":"k","game1_player1_score":1,"game1_player2_score":0,"game2_player1_score":0,"game2_player2_score":1,"game3_player1_score":0,"game3_player2_score":1}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MjQwfQ.hidEIhVAvWXPJfL5J44tja-lHsiGYcWrnoDl40rLa0A' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwnr":1, "test":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/9eba1b79-f3bb-413f-b378-efe52dee48e5/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1Nzk2fQ.h-Estg88OJJxy5nB457juL-FiBn0AkpGq8GNR28hzUg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw null \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/SaveLanguage/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMwODY5fQ.7XSBD3vLtsH05oy8IxJdTySaUEguYZznelCKNruKOQI' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw 1 \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/getInfo/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg2fQ.b8IHuyg60HE4Y8iGZ13uZQFRKgEjRU8F2ZBRib_evgs' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg4fQ.YzJB1JU0DjzmWXRsxMP9_O9V35L2NdgIb7PKKx-d384' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --data-raw None \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   --data-raw '{"username":"test","password1":"kirua&will","password2":"kirua&will","email":"tt@tt","first_name":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/DeleteFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyMzcxfQ.w6ylgf-YZcBEkK6mScPKFjh4yQae2YQSvbVYFiOY7R0' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/FriendRequests/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMjQzNX0.ptrdnoBG59D_9_nw_Q69rE3YXXI7PEmiGbkv56ddJtQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/RefuseFriendRequest/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzA1Mn0.V6t2funirWGa6GOAXJooP6_Ir4A2gUIutsp4ATha-70' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"wruet-su@42"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/createJankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzMzYxfQ.TBGBxpUVFBgM-kK4nBc62mVL0gwMcizlEq8AGQLSDYw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"user_id":"cc"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/getResults/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNTY5fQ.-KOyUgWvQql-5KDGPBNzdrwyAmH4vq2RwRatYPELtlc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2N30.rTrMSbr01aivBh1Kdo88On8V0siJopZMgOyFnQBq98o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure


#   #login
#   curl 'https://192.168.252.193:8443/auth/login/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"username":".","password":"\t"}' \
#   --insecure
# #register
#   curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   --data-raw '{"username":"koko","password1":"kirua&will","password2":"kirua&will","email":"koko@k","first_namee":"koko"}' \
#   --insecure

# #password
#   curl 'https://192.168.252.193:8443/auth/password/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"password":None, "u":"a"}' \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/chatgpt/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzMzAxfQ.RKUztd6qfoU33E_7bHu714S53265WEC9lC8jRv8EChQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"question":"fess"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/c2fffa40-aa9b-4d6b-815e-a1fcb3fd1c8a/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNTEyfQ.Oe8yhKz6vhNjmfF_-p09VCDJY9OvE5GGQxYrJygf_NQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNjQzfQ.8_296s468JEVH94-c0Gf-B1zU6tZ5jt3G0Ga4nro4yw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"player1":"wruet-su@42","game_type":"local","opponent":"Player 2","player_score":5,"opponent_score":3,"winner":"wruet-su@42","loser":"Player 2","result":"Victory","tourney_game":false}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0Mjc2fQ.gTDEUpbeTqHfYL7fJdvAGwz96MeOGPEiytr1gGUkGCk' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"friend_id":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0NTc0fQ.EVRuDItXMkRxmlq6gRio-cfEJLCyxMmhnVaiQER11Ns' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/saveTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MDE2fQ.Xn-bUCX99V_NbLcDrXannyPjAM-bEFJYdain2R_ADQQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwner":"wruet-su@42","Lang":"en","player1":"k","plar2":"a","player3":"l","player4":"wruet-su@42","game1_winner":"k","game1_loser":"a","game2_winner":"l","game2_loser":"wruet-su@42","game3_winner":"l","game3_loser":"k","game1_player1_score":1,"game1_player2_score":0,"game2_player1_score":0,"game2_player2_score":1,"game3_player1_score":0,"game3_player2_score":1}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MjQwfQ.hidEIhVAvWXPJfL5J44tja-lHsiGYcWrnoDl40rLa0A' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwnr":1, "test":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/9eba1b79-f3bb-413f-b378-efe52dee48e5/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1Nzk2fQ.h-Estg88OJJxy5nB457juL-FiBn0AkpGq8GNR28hzUg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw null \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/SaveLanguage/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMwODY5fQ.7XSBD3vLtsH05oy8IxJdTySaUEguYZznelCKNruKOQI' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw 1 \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/getInfo/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg2fQ.b8IHuyg60HE4Y8iGZ13uZQFRKgEjRU8F2ZBRib_evgs' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg4fQ.YzJB1JU0DjzmWXRsxMP9_O9V35L2NdgIb7PKKx-d384' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --data-raw None \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   --data-raw '{"username":"test","password1":"kirua&will","password2":"kirua&will","email":"tt@tt","first_name":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/DeleteFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyMzcxfQ.w6ylgf-YZcBEkK6mScPKFjh4yQae2YQSvbVYFiOY7R0' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/FriendRequests/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMjQzNX0.ptrdnoBG59D_9_nw_Q69rE3YXXI7PEmiGbkv56ddJtQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/RefuseFriendRequest/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzA1Mn0.V6t2funirWGa6GOAXJooP6_Ir4A2gUIutsp4ATha-70' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"wruet-su@42"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/createJankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzMzYxfQ.TBGBxpUVFBgM-kK4nBc62mVL0gwMcizlEq8AGQLSDYw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"user_id":"cc"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/getResults/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNTY5fQ.-KOyUgWvQql-5KDGPBNzdrwyAmH4vq2RwRatYPELtlc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2N30.rTrMSbr01aivBh1Kdo88On8V0siJopZMgOyFnQBq98o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure


#   #login
#   curl 'https://192.168.252.193:8443/auth/login/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"username":".","password":"\t"}' \
#   --insecure
# #register
#   curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   --data-raw '{"username":"koko","password1":"kirua&will","password2":"kirua&will","email":"koko@k","first_namee":"koko"}' \
#   --insecure

# #password
#   curl 'https://192.168.252.193:8443/auth/password/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"password":None, "u":"a"}' \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/chatgpt/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzMzAxfQ.RKUztd6qfoU33E_7bHu714S53265WEC9lC8jRv8EChQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"question":"fess"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/c2fffa40-aa9b-4d6b-815e-a1fcb3fd1c8a/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNTEyfQ.Oe8yhKz6vhNjmfF_-p09VCDJY9OvE5GGQxYrJygf_NQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNjQzfQ.8_296s468JEVH94-c0Gf-B1zU6tZ5jt3G0Ga4nro4yw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"player1":"wruet-su@42","game_type":"local","opponent":"Player 2","player_score":5,"opponent_score":3,"winner":"wruet-su@42","loser":"Player 2","result":"Victory","tourney_game":false}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0Mjc2fQ.gTDEUpbeTqHfYL7fJdvAGwz96MeOGPEiytr1gGUkGCk' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"friend_id":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0NTc0fQ.EVRuDItXMkRxmlq6gRio-cfEJLCyxMmhnVaiQER11Ns' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/saveTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MDE2fQ.Xn-bUCX99V_NbLcDrXannyPjAM-bEFJYdain2R_ADQQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwner":"wruet-su@42","Lang":"en","player1":"k","plar2":"a","player3":"l","player4":"wruet-su@42","game1_winner":"k","game1_loser":"a","game2_winner":"l","game2_loser":"wruet-su@42","game3_winner":"l","game3_loser":"k","game1_player1_score":1,"game1_player2_score":0,"game2_player1_score":0,"game2_player2_score":1,"game3_player1_score":0,"game3_player2_score":1}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MjQwfQ.hidEIhVAvWXPJfL5J44tja-lHsiGYcWrnoDl40rLa0A' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwnr":1, "test":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/9eba1b79-f3bb-413f-b378-efe52dee48e5/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1Nzk2fQ.h-Estg88OJJxy5nB457juL-FiBn0AkpGq8GNR28hzUg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw null \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/SaveLanguage/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMwODY5fQ.7XSBD3vLtsH05oy8IxJdTySaUEguYZznelCKNruKOQI' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw 1 \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/getInfo/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg2fQ.b8IHuyg60HE4Y8iGZ13uZQFRKgEjRU8F2ZBRib_evgs' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg4fQ.YzJB1JU0DjzmWXRsxMP9_O9V35L2NdgIb7PKKx-d384' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --data-raw None \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   --data-raw '{"username":"test","password1":"kirua&will","password2":"kirua&will","email":"tt@tt","first_name":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/DeleteFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyMzcxfQ.w6ylgf-YZcBEkK6mScPKFjh4yQae2YQSvbVYFiOY7R0' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/FriendRequests/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMjQzNX0.ptrdnoBG59D_9_nw_Q69rE3YXXI7PEmiGbkv56ddJtQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/RefuseFriendRequest/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzA1Mn0.V6t2funirWGa6GOAXJooP6_Ir4A2gUIutsp4ATha-70' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"wruet-su@42"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/createJankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzMzYxfQ.TBGBxpUVFBgM-kK4nBc62mVL0gwMcizlEq8AGQLSDYw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"user_id":"cc"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/getResults/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNTY5fQ.-KOyUgWvQql-5KDGPBNzdrwyAmH4vq2RwRatYPELtlc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2N30.rTrMSbr01aivBh1Kdo88On8V0siJopZMgOyFnQBq98o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure


#   #login
#   curl 'https://192.168.252.193:8443/auth/login/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"username":".","password":"\t"}' \
#   --insecure
# #register
#   curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   --data-raw '{"username":"koko","password1":"kirua&will","password2":"kirua&will","email":"koko@k","first_namee":"koko"}' \
#   --insecure

# #password
#   curl 'https://192.168.252.193:8443/auth/password/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"password":None, "u":"a"}' \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/chatgpt/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzMzAxfQ.RKUztd6qfoU33E_7bHu714S53265WEC9lC8jRv8EChQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"question":"fess"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/c2fffa40-aa9b-4d6b-815e-a1fcb3fd1c8a/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNTEyfQ.Oe8yhKz6vhNjmfF_-p09VCDJY9OvE5GGQxYrJygf_NQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNjQzfQ.8_296s468JEVH94-c0Gf-B1zU6tZ5jt3G0Ga4nro4yw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"player1":"wruet-su@42","game_type":"local","opponent":"Player 2","player_score":5,"opponent_score":3,"winner":"wruet-su@42","loser":"Player 2","result":"Victory","tourney_game":false}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0Mjc2fQ.gTDEUpbeTqHfYL7fJdvAGwz96MeOGPEiytr1gGUkGCk' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"friend_id":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0NTc0fQ.EVRuDItXMkRxmlq6gRio-cfEJLCyxMmhnVaiQER11Ns' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/saveTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MDE2fQ.Xn-bUCX99V_NbLcDrXannyPjAM-bEFJYdain2R_ADQQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwner":"wruet-su@42","Lang":"en","player1":"k","plar2":"a","player3":"l","player4":"wruet-su@42","game1_winner":"k","game1_loser":"a","game2_winner":"l","game2_loser":"wruet-su@42","game3_winner":"l","game3_loser":"k","game1_player1_score":1,"game1_player2_score":0,"game2_player1_score":0,"game2_player2_score":1,"game3_player1_score":0,"game3_player2_score":1}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MjQwfQ.hidEIhVAvWXPJfL5J44tja-lHsiGYcWrnoDl40rLa0A' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwnr":1, "test":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/9eba1b79-f3bb-413f-b378-efe52dee48e5/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1Nzk2fQ.h-Estg88OJJxy5nB457juL-FiBn0AkpGq8GNR28hzUg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw null \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/SaveLanguage/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMwODY5fQ.7XSBD3vLtsH05oy8IxJdTySaUEguYZznelCKNruKOQI' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw 1 \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/getInfo/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg2fQ.b8IHuyg60HE4Y8iGZ13uZQFRKgEjRU8F2ZBRib_evgs' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg4fQ.YzJB1JU0DjzmWXRsxMP9_O9V35L2NdgIb7PKKx-d384' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --data-raw None \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   --data-raw '{"username":"test","password1":"kirua&will","password2":"kirua&will","email":"tt@tt","first_name":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/DeleteFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyMzcxfQ.w6ylgf-YZcBEkK6mScPKFjh4yQae2YQSvbVYFiOY7R0' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/FriendRequests/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMjQzNX0.ptrdnoBG59D_9_nw_Q69rE3YXXI7PEmiGbkv56ddJtQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/RefuseFriendRequest/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzA1Mn0.V6t2funirWGa6GOAXJooP6_Ir4A2gUIutsp4ATha-70' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"wruet-su@42"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/createJankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzMzYxfQ.TBGBxpUVFBgM-kK4nBc62mVL0gwMcizlEq8AGQLSDYw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"user_id":"cc"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/getResults/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNTY5fQ.-KOyUgWvQql-5KDGPBNzdrwyAmH4vq2RwRatYPELtlc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2N30.rTrMSbr01aivBh1Kdo88On8V0siJopZMgOyFnQBq98o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure


#   #login
#   curl 'https://192.168.252.193:8443/auth/login/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"username":".","password":"\t"}' \
#   --insecure
# #register
#   curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   --data-raw '{"username":"koko","password1":"kirua&will","password2":"kirua&will","email":"koko@k","first_namee":"koko"}' \
#   --insecure

# #password
#   curl 'https://192.168.252.193:8443/auth/password/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"password":None, "u":"a"}' \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/chatgpt/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzMzAxfQ.RKUztd6qfoU33E_7bHu714S53265WEC9lC8jRv8EChQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"question":"fess"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/c2fffa40-aa9b-4d6b-815e-a1fcb3fd1c8a/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNTEyfQ.Oe8yhKz6vhNjmfF_-p09VCDJY9OvE5GGQxYrJygf_NQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNjQzfQ.8_296s468JEVH94-c0Gf-B1zU6tZ5jt3G0Ga4nro4yw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"player1":"wruet-su@42","game_type":"local","opponent":"Player 2","player_score":5,"opponent_score":3,"winner":"wruet-su@42","loser":"Player 2","result":"Victory","tourney_game":false}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0Mjc2fQ.gTDEUpbeTqHfYL7fJdvAGwz96MeOGPEiytr1gGUkGCk' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"friend_id":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0NTc0fQ.EVRuDItXMkRxmlq6gRio-cfEJLCyxMmhnVaiQER11Ns' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/saveTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MDE2fQ.Xn-bUCX99V_NbLcDrXannyPjAM-bEFJYdain2R_ADQQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwner":"wruet-su@42","Lang":"en","player1":"k","plar2":"a","player3":"l","player4":"wruet-su@42","game1_winner":"k","game1_loser":"a","game2_winner":"l","game2_loser":"wruet-su@42","game3_winner":"l","game3_loser":"k","game1_player1_score":1,"game1_player2_score":0,"game2_player1_score":0,"game2_player2_score":1,"game3_player1_score":0,"game3_player2_score":1}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MjQwfQ.hidEIhVAvWXPJfL5J44tja-lHsiGYcWrnoDl40rLa0A' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwnr":1, "test":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/9eba1b79-f3bb-413f-b378-efe52dee48e5/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1Nzk2fQ.h-Estg88OJJxy5nB457juL-FiBn0AkpGq8GNR28hzUg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw null \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/SaveLanguage/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMwODY5fQ.7XSBD3vLtsH05oy8IxJdTySaUEguYZznelCKNruKOQI' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw 1 \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/getInfo/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg2fQ.b8IHuyg60HE4Y8iGZ13uZQFRKgEjRU8F2ZBRib_evgs' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg4fQ.YzJB1JU0DjzmWXRsxMP9_O9V35L2NdgIb7PKKx-d384' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --data-raw None \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   --data-raw '{"username":"test","password1":"kirua&will","password2":"kirua&will","email":"tt@tt","first_name":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/DeleteFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyMzcxfQ.w6ylgf-YZcBEkK6mScPKFjh4yQae2YQSvbVYFiOY7R0' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/FriendRequests/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMjQzNX0.ptrdnoBG59D_9_nw_Q69rE3YXXI7PEmiGbkv56ddJtQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/RefuseFriendRequest/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzA1Mn0.V6t2funirWGa6GOAXJooP6_Ir4A2gUIutsp4ATha-70' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"wruet-su@42"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/createJankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzMzYxfQ.TBGBxpUVFBgM-kK4nBc62mVL0gwMcizlEq8AGQLSDYw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"user_id":"cc"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/getResults/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNTY5fQ.-KOyUgWvQql-5KDGPBNzdrwyAmH4vq2RwRatYPELtlc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2N30.rTrMSbr01aivBh1Kdo88On8V0siJopZMgOyFnQBq98o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure


#   #login
#   curl 'https://192.168.252.193:8443/auth/login/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"username":".","password":"\t"}' \
#   --insecure
# #register
#   curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   --data-raw '{"username":"koko","password1":"kirua&will","password2":"kirua&will","email":"koko@k","first_namee":"koko"}' \
#   --insecure

# #password
#   curl 'https://192.168.252.193:8443/auth/password/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"password":None, "u":"a"}' \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/chatgpt/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzMzAxfQ.RKUztd6qfoU33E_7bHu714S53265WEC9lC8jRv8EChQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"question":"fess"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/c2fffa40-aa9b-4d6b-815e-a1fcb3fd1c8a/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNTEyfQ.Oe8yhKz6vhNjmfF_-p09VCDJY9OvE5GGQxYrJygf_NQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNjQzfQ.8_296s468JEVH94-c0Gf-B1zU6tZ5jt3G0Ga4nro4yw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"player1":"wruet-su@42","game_type":"local","opponent":"Player 2","player_score":5,"opponent_score":3,"winner":"wruet-su@42","loser":"Player 2","result":"Victory","tourney_game":false}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0Mjc2fQ.gTDEUpbeTqHfYL7fJdvAGwz96MeOGPEiytr1gGUkGCk' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"friend_id":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0NTc0fQ.EVRuDItXMkRxmlq6gRio-cfEJLCyxMmhnVaiQER11Ns' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/saveTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MDE2fQ.Xn-bUCX99V_NbLcDrXannyPjAM-bEFJYdain2R_ADQQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwner":"wruet-su@42","Lang":"en","player1":"k","plar2":"a","player3":"l","player4":"wruet-su@42","game1_winner":"k","game1_loser":"a","game2_winner":"l","game2_loser":"wruet-su@42","game3_winner":"l","game3_loser":"k","game1_player1_score":1,"game1_player2_score":0,"game2_player1_score":0,"game2_player2_score":1,"game3_player1_score":0,"game3_player2_score":1}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MjQwfQ.hidEIhVAvWXPJfL5J44tja-lHsiGYcWrnoDl40rLa0A' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwnr":1, "test":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/9eba1b79-f3bb-413f-b378-efe52dee48e5/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1Nzk2fQ.h-Estg88OJJxy5nB457juL-FiBn0AkpGq8GNR28hzUg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw null \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/SaveLanguage/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMwODY5fQ.7XSBD3vLtsH05oy8IxJdTySaUEguYZznelCKNruKOQI' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw 1 \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/getInfo/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg2fQ.b8IHuyg60HE4Y8iGZ13uZQFRKgEjRU8F2ZBRib_evgs' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg4fQ.YzJB1JU0DjzmWXRsxMP9_O9V35L2NdgIb7PKKx-d384' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --data-raw None \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   --data-raw '{"username":"test","password1":"kirua&will","password2":"kirua&will","email":"tt@tt","first_name":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/DeleteFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyMzcxfQ.w6ylgf-YZcBEkK6mScPKFjh4yQae2YQSvbVYFiOY7R0' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/FriendRequests/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMjQzNX0.ptrdnoBG59D_9_nw_Q69rE3YXXI7PEmiGbkv56ddJtQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/RefuseFriendRequest/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzA1Mn0.V6t2funirWGa6GOAXJooP6_Ir4A2gUIutsp4ATha-70' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"wruet-su@42"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/createJankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzMzYxfQ.TBGBxpUVFBgM-kK4nBc62mVL0gwMcizlEq8AGQLSDYw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"user_id":"cc"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/getResults/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNTY5fQ.-KOyUgWvQql-5KDGPBNzdrwyAmH4vq2RwRatYPELtlc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2N30.rTrMSbr01aivBh1Kdo88On8V0siJopZMgOyFnQBq98o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure


#   #login
#   curl 'https://192.168.252.193:8443/auth/login/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"username":".","password":"\t"}' \
#   --insecure
# #register
#   curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   --data-raw '{"username":"koko","password1":"kirua&will","password2":"kirua&will","email":"koko@k","first_namee":"koko"}' \
#   --insecure

# #password
#   curl 'https://192.168.252.193:8443/auth/password/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"password":None, "u":"a"}' \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/chatgpt/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzMzAxfQ.RKUztd6qfoU33E_7bHu714S53265WEC9lC8jRv8EChQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"question":"fess"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/c2fffa40-aa9b-4d6b-815e-a1fcb3fd1c8a/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNTEyfQ.Oe8yhKz6vhNjmfF_-p09VCDJY9OvE5GGQxYrJygf_NQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNjQzfQ.8_296s468JEVH94-c0Gf-B1zU6tZ5jt3G0Ga4nro4yw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"player1":"wruet-su@42","game_type":"local","opponent":"Player 2","player_score":5,"opponent_score":3,"winner":"wruet-su@42","loser":"Player 2","result":"Victory","tourney_game":false}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0Mjc2fQ.gTDEUpbeTqHfYL7fJdvAGwz96MeOGPEiytr1gGUkGCk' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"friend_id":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0NTc0fQ.EVRuDItXMkRxmlq6gRio-cfEJLCyxMmhnVaiQER11Ns' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/saveTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MDE2fQ.Xn-bUCX99V_NbLcDrXannyPjAM-bEFJYdain2R_ADQQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwner":"wruet-su@42","Lang":"en","player1":"k","plar2":"a","player3":"l","player4":"wruet-su@42","game1_winner":"k","game1_loser":"a","game2_winner":"l","game2_loser":"wruet-su@42","game3_winner":"l","game3_loser":"k","game1_player1_score":1,"game1_player2_score":0,"game2_player1_score":0,"game2_player2_score":1,"game3_player1_score":0,"game3_player2_score":1}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MjQwfQ.hidEIhVAvWXPJfL5J44tja-lHsiGYcWrnoDl40rLa0A' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwnr":1, "test":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/9eba1b79-f3bb-413f-b378-efe52dee48e5/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1Nzk2fQ.h-Estg88OJJxy5nB457juL-FiBn0AkpGq8GNR28hzUg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw null \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/SaveLanguage/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMwODY5fQ.7XSBD3vLtsH05oy8IxJdTySaUEguYZznelCKNruKOQI' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw 1 \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/getInfo/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg2fQ.b8IHuyg60HE4Y8iGZ13uZQFRKgEjRU8F2ZBRib_evgs' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg4fQ.YzJB1JU0DjzmWXRsxMP9_O9V35L2NdgIb7PKKx-d384' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --data-raw None \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   --data-raw '{"username":"test","password1":"kirua&will","password2":"kirua&will","email":"tt@tt","first_name":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/DeleteFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyMzcxfQ.w6ylgf-YZcBEkK6mScPKFjh4yQae2YQSvbVYFiOY7R0' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/FriendRequests/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMjQzNX0.ptrdnoBG59D_9_nw_Q69rE3YXXI7PEmiGbkv56ddJtQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/RefuseFriendRequest/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzA1Mn0.V6t2funirWGa6GOAXJooP6_Ir4A2gUIutsp4ATha-70' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"wruet-su@42"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/createJankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzMzYxfQ.TBGBxpUVFBgM-kK4nBc62mVL0gwMcizlEq8AGQLSDYw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"user_id":"cc"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/getResults/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNTY5fQ.-KOyUgWvQql-5KDGPBNzdrwyAmH4vq2RwRatYPELtlc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2N30.rTrMSbr01aivBh1Kdo88On8V0siJopZMgOyFnQBq98o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure


#   #login
#   curl 'https://192.168.252.193:8443/auth/login/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"username":".","password":"\t"}' \
#   --insecure
# #register
#   curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: jZqvWrmmNI8EbKifzFqMvJQgyTu36Rtv' \
#   --data-raw '{"username":"koko","password1":"kirua&will","password2":"kirua&will","email":"koko@k","first_namee":"koko"}' \
#   --insecure

# #password
#   curl 'https://192.168.252.193:8443/auth/password/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEyMTQ5fQ.Xf6XyAja31t9q46SQ3REMdMF2yCuuni4cIGS5NYgNa8' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"password":None, "u":"a"}' \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/chatgpt/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzMzAxfQ.RKUztd6qfoU33E_7bHu714S53265WEC9lC8jRv8EChQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"question":"fess"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/c2fffa40-aa9b-4d6b-815e-a1fcb3fd1c8a/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNTEyfQ.Oe8yhKz6vhNjmfF_-p09VCDJY9OvE5GGQxYrJygf_NQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzEzNjQzfQ.8_296s468JEVH94-c0Gf-B1zU6tZ5jt3G0Ga4nro4yw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"player1":"wruet-su@42","game_type":"local","opponent":"Player 2","player_score":5,"opponent_score":3,"winner":"wruet-su@42","loser":"Player 2","result":"Victory","tourney_game":false}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0Mjc2fQ.gTDEUpbeTqHfYL7fJdvAGwz96MeOGPEiytr1gGUkGCk' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"friend_id":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE0NTc0fQ.EVRuDItXMkRxmlq6gRio-cfEJLCyxMmhnVaiQER11Ns' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/saveTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MDE2fQ.Xn-bUCX99V_NbLcDrXannyPjAM-bEFJYdain2R_ADQQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwner":"wruet-su@42","Lang":"en","player1":"k","plar2":"a","player3":"l","player4":"wruet-su@42","game1_winner":"k","game1_loser":"a","game2_winner":"l","game2_loser":"wruet-su@42","game3_winner":"l","game3_loser":"k","game1_player1_score":1,"game1_player2_score":0,"game2_player1_score":0,"game2_player2_score":1,"game3_player1_score":0,"game3_player2_score":1}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1MjQwfQ.hidEIhVAvWXPJfL5J44tja-lHsiGYcWrnoDl40rLa0A' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw '{"tournamentOwnr":1, "test":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/9eba1b79-f3bb-413f-b378-efe52dee48e5/' \
#   -X 'PUT' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzE1Nzk2fQ.h-Estg88OJJxy5nB457juL-FiBn0AkpGq8GNR28hzUg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw null \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/SaveLanguage/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMwODY5fQ.7XSBD3vLtsH05oy8IxJdTySaUEguYZznelCKNruKOQI' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb; sessionid=m7i1qf0it7e5lf4p0lpcixqigt64innh' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: h7B2ptRI1IPRd2KslRxfEgqNjWLHE5Vb' \
#   --data-raw 1 \
#   --insecure


# curl 'https://192.168.252.193:8443/auth/getInfo/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg2fQ.b8IHuyg60HE4Y8iGZ13uZQFRKgEjRU8F2ZBRib_evgs' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --insecure

# curl 'https://192.168.252.193:8443/game/pongHistory/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMxMDg4fQ.YzJB1JU0DjzmWXRsxMP9_O9V35L2NdgIb7PKKx-d384' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X; sessionid=v1ju6776pp9r5hcas9x8eywh8u0yoy6q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: nDSMzKcp3m5T0eWRC82d2i2P8VyvL55X' \
#   --data-raw None \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/register/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer null' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: YYmdacxjlx4QBiz9AN328ZgO6CNL5RI9' \
#   --data-raw '{"username":"test","password1":"kirua&will","password2":"kirua&will","email":"tt@tt","first_name":None}' \
#   --insecure

# curl 'https://192.168.252.193:8443/auth/DeleteFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyMzcxfQ.w6ylgf-YZcBEkK6mScPKFjh4yQae2YQSvbVYFiOY7R0' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/FriendRequests/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMjQzNX0.ptrdnoBG59D_9_nw_Q69rE3YXXI7PEmiGbkv56ddJtQ' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/RefuseFriendRequest/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzA1Mn0.V6t2funirWGa6GOAXJooP6_Ir4A2gUIutsp4ATha-70' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"friend":"wruet-su@42"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/createJankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzMzYxfQ.TBGBxpUVFBgM-kK4nBc62mVL0gwMcizlEq8AGQLSDYw' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/getNicknameWithUserId/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"user_id":"cc"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2OH0.dRv1-mi77J83oudJGWVen2LwvUn77mdldKcbuUmt4GU' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/getResults/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNDQ5fQ.d9qS-EgQ48eHMj6dKOC3H41dklHxnmXtQ9VqQQfcF3o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMzNTY5fQ.-KOyUgWvQql-5KDGPBNzdrwyAmH4vq2RwRatYPELtlc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"input":"paper"}' \
#   --insecure

#   curl 'https://192.168.252.193:8443/janken/jankenGame/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InRlc3QiLCJuaWNrbmFtZSI6InRlc3QiLCJzZWNyZXQiOiJzLWZ6ZWZ6ZTc4WkFkemQ4WjdoZHpEQVphRDg5ZGRkZCIsImV4cCI6MTcxNDMzMzM2N30.rTrMSbr01aivBh1Kdo88On8V0siJopZMgOyFnQBq98o' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j; sessionid=clglujfbd84b1hzd0rku3zisbf3bqwia' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: KG4SigPvRbKfbWuSES9SDaaSt2SLPx2j' \
#   --insecure

#   curl 'https://192.168.252.193:8443/auth/addFriend/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0MzMyOTk0fQ.tdX3mMc-l0WaozXFBPtY2QI6D2Pc8mCQN05dk4UeClg' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=z225Dct8lpUUvdS381AmilQoXrEKBom4; sessionid=fyedzvv3c112paquo78ome4j41ae2xt2' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: z225Dct8lpUUvdS381AmilQoXrEKBom4' \
#   --data-raw '{"friend":"test"}' \
#   --insecure

# curl 'https://192.168.252.193:8443/tournament/getTournament/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0Mzc3NDUzfQ.0p7n-EPPCOnhaugdbDhsQW9XhgGTUuVQym2ZMq_pxMc' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=7XoYSN401VNNK6imXM0PgnaBwgmvaPFs; sessionid=1j8qcl6ikxqticzuvff7uwgbgpd0zb2q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: 7XoYSN401VNNK6imXM0PgnaBwgmvaPFs' \
#   --data-raw {"tournamentOwner":null} \
#   --insecure

# curl 'https://192.168.252.193:8443/janken/getFriendStats/' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7' \
#   -H 'authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6IndydWV0LXN1QDQyIiwibmlja25hbWUiOiJ3cnVldC1zdUA0MiIsInNlY3JldCI6InMtZnplZnplNzhaQWR6ZDhaN2hkekRBWmFEODlkZGRkIiwiZXhwIjoxNzE0Mzc3Njc1fQ.aMe-5DVDdDAYC4yYvLcocSAbd-CBovzul04iTr6j69c' \
#   -H 'content-type: application/json' \
#   -H 'cookie: csrftoken=7XoYSN401VNNK6imXM0PgnaBwgmvaPFs; sessionid=1j8qcl6ikxqticzuvff7uwgbgpd0zb2q' \
#   -H 'origin: https://192.168.252.193:8443' \
#   -H 'priority: u=1, i' \
#   -H 'referer: https://192.168.252.193:8443/' \
#   -H 'sec-ch-ua: "Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36' \
#   -H 'x-csrftoken: 7XoYSN401VNNK6imXM0PgnaBwgmvaPFs' \
#   --data-raw '[]' \
#   --insecure