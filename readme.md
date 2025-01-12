# Instalacion

1. Instalar raspberry os lite, utilizando rpi-imager (configurar network, nombre de usuario, ssh, etc)
2. Al parecer el locale quedo mal configurado en GB, lo tube que cambiar a uy
3. Instalar docker y docker compose
4. imito la configuracion de las carpeta en red que tengo en /etc/fstab
5. iniciar dockers
6. instalar hacas
```
sudo docker exec -it [dockername] bash
wget -O - https://get.hacs.xyz | bash -
```
7. configurar luces
8. 