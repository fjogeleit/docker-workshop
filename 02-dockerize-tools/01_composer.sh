#!/bin/bash

# Run composer install to install all app depencies
docker run --rm -v $(pwd)/app:/app composer install