#!/bin/sh

curl "https://discord.com/api/download?platform=linux&format=tar.gz" -s -L -I -o /dev/null -w '%{url_effective}'