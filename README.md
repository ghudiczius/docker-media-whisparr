# Whisparr

Simple docker image for Whisparr without any bloat, built on the official mono image. Radarr runs as user `whisparr` with `uid` and `gid` `1000` and listens on port `6969`.

## Usage

```sh
docker run --rm registry.gitlab.jmk.hu/media/whisparr:<VERSION> \
  -p 6969:6969 \
  -v path/to/config:/config \
  -v path/to/downloads:/downloads \
  -v path/to/xxx:/xxx
```

or

```sh
docker run --rm ghudiczius/whisparr:<VERSION> \
  -p 6969:6969 \
  -v path/to/config:/config \
  -v path/to/downloads:/downloads \
  -v path/to/xxx:/xxx
```
