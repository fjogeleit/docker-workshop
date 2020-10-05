#!/bin/bash

# Run PHPCS for CodeStyle checks
docker run -v $(pwd)/app:/data --rm cytopia/phpcs src -p