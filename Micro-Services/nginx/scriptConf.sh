envsubst '${HOST_IP}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

openssl req -x509 -newkey rsa:2048 -nodes -subj "/C=FR/ST=Rhone/L=Charbonnieres-les-Bains/O=42/" -keyout /etc/ssl/transcendence.key -out /etc/ssl/transcendence.crt

nginx -g 'daemon off;'
