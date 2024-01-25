#!/bin/bash

./update_and_restart.sh && docker system prune --force && docker-compose logs -f