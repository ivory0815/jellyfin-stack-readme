#!/bin/bash
# Führt Watchtower-Update für alle Container durch
docker run --rm   -v /var/run/docker.sock:/var/run/docker.sock   containrrr/watchtower   --cleanup --run-once