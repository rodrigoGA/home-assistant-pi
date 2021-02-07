# Docker-compose files for a simple uptodate
# Home Assistant
# + InfluxDB
# + Grafana
# + Pi-hole

Home Assistant is an open source tool for home automation.

Sensor data (temperature, item status, power usage, etc...) is stored in Home Assistant for a short time but will be send to InfluxDB for the long term. Grafana is used to observe and monitor this sensor data.

Pi-hole blocks ads network wide or per host. It can also be used as local DNS server to create nice local hostnames like http://home.assistant:8123

This setup runs on a Raspberry Pi 3 with Docker and Docker Compose. See https://github.com/earlhickey/raspberry-pi_setup_with_docker for a quick setup.

## Hardware

* Raspbery Pi 3 + 16GB SD
* Z-Wave USB Stick (ZMEEUZB1) by Z-Wave.ME
* Qubino ZMNHID1 Flush on/Off Thermostat
* Philps Hue Bridge
* Philps Hue Dimmer switch
* Philps Hue White ambiance 3x
* Philps Hue White 2x

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

Grafana user 742 needs access to data folder
```
sudo chown 472:472 ./grafana
```

Copy and adjust secrets file
```
cp hass/secrets_example.yaml hass/secrets.yaml
vi hass/secrets.yaml
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

## Url's:

Home Assistant
http://home.assistant:8123/

Grafana (admin/admin)
http://home.assistant:3000/

Pi-hole
http://home.assistant/admin/

Set or reset web interface password
```
docker exec -it pihole_container_name pihole -a -p
```
