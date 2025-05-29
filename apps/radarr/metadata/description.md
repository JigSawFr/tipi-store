![banner](https://github.com/11notes/defaults/blob/main/static/img/banner.png?raw=true)

# RADARR
[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/11notes/docker-RADARR)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![size](https://img.shields.io/docker/image-size/11notes/radarr/5.25.0?color=0eb305)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![version](https://img.shields.io/docker/v/11notes/radarr/5.25.0?color=eb7a09)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![pulls](https://img.shields.io/docker/pulls/11notes/radarr?color=2b75d6)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)[<img src="https://img.shields.io/github/issues/11notes/docker-RADARR?color=7842f5">](https://github.com/11notes/docker-RADARR/issues)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![swiss_made](https://img.shields.io/badge/Swiss_Made-FFFFFF?labelColor=FF0000&logo=data:image/svg%2bxml;base64,PHN2ZyB2ZXJzaW9uPSIxIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDMyIDMyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Im0wIDBoMzJ2MzJoLTMyeiIgZmlsbD0iI2YwMCIvPjxwYXRoIGQ9Im0xMyA2aDZ2N2g3djZoLTd2N2gtNnYtN2gtN3YtNmg3eiIgZmlsbD0iI2ZmZiIvPjwvc3ZnPg==)

Run Radarr smaller, lightweight and more secure

# SYNOPSIS 📖
**What can I do with this?** This image will give you a rootless and lightweight Radarr installation. Radarr is a PVR for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

# UNIQUE VALUE PROPOSITION 💶
**Why should I run this image and not the other image(s) that already exist?** Good question! All the other images on the market that do exactly the same don’t do or offer these options:

> [!IMPORTANT]
>* This image runs as 1000:1000 by default, most other images run everything as root
>* This image is created via a secure, pinned CI/CD process and immune to upstream attacks, most other images have upstream dependencies that can be exploited
>* This image contains a proper health check that verifies the app is actually working, most other images have either no health check or only check if a port is open or ping works
>* This image works as read-only, most other images need to write files to the image filesystem
>* This repository has an auto update feature that will automatically build the latest version if released, most other providers don't do this
>* This image is smaller than most other images

If you value security, simplicity and the ability to interact with the maintainer and developer of an image. Using my images is a great start in that direction.

# COMPARISON 🏁
Below you find a comparison between this image and the most used or original one.

| **image** | 11notes/radarr:5.25.0 | linuxserver/radarr:5.25.0 |
| ---: | :---: | :---: |
| **image size on disk** | 184MB | 207MB |
| **process UID/GID** | 1000/1000 | 0/0 |
| **distroless?** | ❌ | ❌ |
| **rootless?** | ✅ | ❌ |


**Why is this image not distroless?** I would have loved to create a distroless, single binary image, sadly the way that Radarr is setup makes it really difficult to compile a static binary from source. Enabling AOT breaks almost 30% of used libraries because they are not setup to be statically linked (like Assembly.GetExecutingAssembly().Location). It’s also not fixable with a single PR. This is something the Radarr team would need to do.

# VOLUMES 📁

| Mounted folder                                       | Container folder |  Comments |
|---------------------------------------|------------------|-------------------|
| `/runtipi/app-data/jigsaw-tipi-store/radarr/data`   | `/config`          | directory of all your settings and database
| `/runtipi/media`                                    | `/media`           | directory of your medias


# DEFAULT SETTINGS 🗃️
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | user name |
| `uid` | 1000 | [user identifier](https://en.wikipedia.org/wiki/User_identifier) |
| `gid` | 1000 | [group identifier](https://en.wikipedia.org/wiki/Group_identifier) |
| `home` | /radarr | home directory of user docker |

# ENVIRONMENT 📝
| Parameter | Value | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | |
| `DEBUG` | Will activate debug option for container image and app (if available) | |
# SOURCE 💾
* [11notes/radarr](https://github.com/11notes/docker-RADARR)

# PARENT IMAGE 🏛️
* [11notes/alpine:stable](https://hub.docker.com/r/11notes/alpine)

# BUILT WITH 🧰
* [radarr](https://github.com/Radarr/Radarr)
* [11notes/util](https://github.com/11notes/docker-util)

# ElevenNotes™️
This image is provided to you at your own risk. Always make backups before updating an image to a different version. Check the [releases](https://github.com/11notes/docker-radarr/releases) for breaking changes. If you have any problems with using this image simply raise an [issue](https://github.com/11notes/docker-radarr/issues), thanks. If you have a question or inputs please create a new [discussion](https://github.com/11notes/docker-radarr/discussions) instead of an issue. You can find all my other repositories on [github](https://github.com/11notes?tab=repositories).
