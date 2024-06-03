#/bin/bash

cd ~
wget -O caddy_linux_amd64_custom "https://caddyserver.com/api/download?os=linux&arch=amd64&p=github.com%2Fcaddy-dns%2Fcloudflare&idempotency=72186849443355"
systemctl stop caddy
chmod +x caddy_linux_amd64_custom
./caddy_linux_amd64_custom list-modules | grep dns
sudo cp caddy_linux_amd64_custom /usr/bin/caddy
systemctl restart caddy

# diable auto update to avoid auto rm file '/usr/bin/caddy'
sudo apt-mark hold caddy
# sudo apt-mark unhold caddy
