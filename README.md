# docker-images

This is a repo to build the docker images for mist-alpha that are stored in gitlab container registry.
- each folder has a Makefile with commands to build images and push to the container registry
- if you cannot access `registry.url.ca` then contact `matmccann@gmail.com`

---

| Repo | Description |
|:-------:| ----------- |
| [deploy](deploy) | CI-CD deploy image |
| [elk-stack](elk-stack) | x_86 architecture |
| [backend-x86](backend-x86) | x_86 architecture  |
| [backend-arm64](backend-arm64) | arm64 architecture  |


- before running, it is usually a good idea to do this!
```bash
sudo chmod -R 777 **/*/*.sh
```