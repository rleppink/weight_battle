#!/usr/bin/env bash

docker run \
	--name weight-battle-db \
	--rm \
	--env POSTGRES_PASSWORD=postgres \
	--publish 5432:5432 \
	--volume ${PWD}/_db:/var/lib/postgresql/data \
	postgres
