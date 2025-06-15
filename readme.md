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



# crear backup immich
```
docker exec -t immich_postgres pg_dumpall --clean --if-exists --username=postgres \
  | gzip > "/media/DataRaid/Media/PhotoLibrary/backups/immich-db-backup-$(date +%s%3N).sql.gz"
```

# Actaulizar immich
```
docker compose -f docker-compose.immich.yml stop

docker compose -f docker-compose.immich.yml pull && docker compose -f docker-compose.immich.yml up -d

docker image prune

```

