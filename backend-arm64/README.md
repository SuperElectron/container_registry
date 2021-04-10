![docker](https://img.shields.io/badge/docker-19.03.8-blue)

------

# Table of contents
1. [Introduction](#introduction)
2. [Configuration](#configuration)

# Introduction

Refer to http://192.168.20.200/mist/mist1b/mist-alpha for project architecture drawing

# Configuration

- view the Makefile for general commands on building images and pushing them to MIST container registry

__Makefile: useful commands__

```bash
sudo make stop-clean
<stop and remove project specific images>

sudo make clean
<stop and fresh start>


sudo make build-push-stack
<build and push all images>

sudo make clean
<clear all images>
```
