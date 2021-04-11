# Xupnpd v2 Docker - [Overclock Server](https://lordpedal.github.io)

## Modos de ejecución para crear el contenedor Docker

### docker-compose (*Opción recomendada*)

Compatible con los esquemas docker-compose v2.

```
version: "2"
services:
  xupnpdv2:
    image: lordpedal/xupnpdv2
    container_name: Xupnpdv2
    network_mode: host
    volumes:
      - '~/docker/xupnpdv2/listas:/xupnpd2/media'
    restart: always
```

### docker-cli

```
docker run -d \
        --name Xupnpdv2 \
        --network host \
        --restart always \
        -v $HOME/docker/xupnpdv2/listas:/xupnpd2/media \
        lordpedal/xupnpdv2
```

## Parámetros

Necesario crear la carpeta donde se almacenan las listas M3U con permisos de usuario local

`mkdir -p $HOME/docker/xupnpdv2/listas`

| Parámetro | Función |
| ------ | ------ |
| `--net=host` | Habilitamos uso de la red `host` en vez de una virtual para docker |
| `-v $HOME/docker/xupnpdv2/listas:/xupnpd2/media` | Ruta donde se leen/almacenan listas localmente |

## Gestión Web

Accedemos con un navegador web a la `ip_del_host:3044` para usar la interfaz web.

> ... la culminación de un fin es el comienzo de una realidad.
