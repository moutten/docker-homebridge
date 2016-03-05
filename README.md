# docker: homebridge (with indigo plugin)

[![](https://badge.imagelayers.io/moutten/homebridge:latest.svg)](https://imagelayers.io/?images=moutten/homebridge:latest 'Get your own badge on imagelayers.io')

This is a docker image to run the [homebridge tool](https://github.com/nfarina/homebridge) with the 
[homebridge-indigo plugin](https://www.npmjs.com/package/homebridge-indigo) enabled.

### Build from docker file

If you want to build the docker container image yourself you can do so with the
following commands:

```bash
git clone git@github.com:moutten/docker-homebridge.git
cd docker-homebridge
docker build -t homebridge .
```

### Pulling from docker hub

If you just want to obtain the image from the docker registry, you can use the
following command:

```bash
docker pull moutten/homebridge
```

### Running the image

In order to run the homebridge server command in daemonized mode, use the following:

```bash
docker run -d --net="host" -v /PATH_TO_HOMEBRIDGE_CONFIG_DIRECTORY:/config moutten/homebridge
```

