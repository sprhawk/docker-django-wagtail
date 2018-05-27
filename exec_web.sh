#!/bin/bash
docker-compose run web sh -c ". /usr/local/venv/bin/activate && $*" 
