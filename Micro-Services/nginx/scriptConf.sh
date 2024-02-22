#!/bin/sh

# Remplace les variables d'environnement dans le fichier de configuration Nginx
envsubst '${HOST_IP}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Démarre Nginx en mode foreground
nginx -g 'daemon off;'