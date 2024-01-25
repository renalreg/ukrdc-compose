#!/bin/bash

./update_and_restart.sh && docker system prune && docker-compose logs -f