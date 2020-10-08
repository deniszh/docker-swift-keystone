# docker-swift-keystone

Swift and Keystone in Docker container, suitable for docker compose and testing Openstack Swift.

This repo is Bionic-ized and simplified merge of https://github.com/globocom/docker-swift-keystone and https://github.com/MorrisJobke/docker-swift-onlyone

Didn't do any optimizations or upgrades to Python 3 etc. Please don't use in production, this is for testing Swift only!

Original README below:

Docker for Swift and Keystone. (each app on a docker container started by docker-compose)

This project aims to provide a swift docker image with a custom configuration for keystone authorization system.
The docker-compose file shows how to use this swift image with the keystone image named garland/docker-openstack-keystone.

Environment variables wich can be replaced by user's values:

- KS_TENANT_NAME="gcom" (optional)
- KS_USER_NAME="gcom-user" (optional)
- KS_USER_PASSWORD="gcom-password" (optional)
- KS_USER_EMAIL="appdev@corp.com" (optional)
- KS_SWIFT_PUBLIC_URL="http://s3.local.com:8080"
- KS_SWIFT_INTERNAL_URL="http://s3.local.com:8080"
- KS_SWIFT_ADMIN_URL="http://s3.local.com:8080"
- KS_ADMIN_URL="http://auth.s3.local.com:35357"

To start up a container with this swift image, the user has only to fill out the non optional enviroment variables. Remember that the swift image has to be used with a keystone image.