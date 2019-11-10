# Docker-compose files for a simple uptodate
# Home Assistant
# + InfluxDB
# + Grafana
# + Pi-hole

Home Assistant is an open source tool for home automation.

Sensor data (temperature, item status, power usage, etc...) is stored in Home Assistant for a short time but will be send to InfluxDB for the long term. Grafana is used to observe and monitor this sensor data.

Pi-hole blocks ads network wide or per host. It can also be used as local DNS server to create nice local hostnames like http://home.assistant:8123

This setup runs on a Raspberry Pi 3 with Docker and Docker Compose. See https://github.com/earlhickey/raspberry-pi_setup_with_docker for a quick setup.

## Get the stack (only once):

```
git clone https://github.com/earlhickey/home-assistant-pi.git
cd home-assistant-pi
docker pull homeassistant/raspberrypi3-homeassistant
docker pull influxdb
docker pull grafana/grafana
docker pull pihole/pihole
```

## Update settings (only once):

```
cd hass
cp secrets_example.yaml secrets.yaml
vi secrets.yaml
```

## Run your stack:

```
docker-compose up -d

```

## Show me the logs:

```
docker-compose logs
```

## Stop it:

```
docker-compose stop
docker-compose rm
```

## Update it:

```
cd home-assistant-pi
git pull
docker pull homeassistant/raspberrypi3-homeassistant
docker pull influxdb
docker pull grafana/grafana
docker pull pihole/pihole
```

## Login into running docker machine
```
docker exec -it influxdb /bin/bash
```