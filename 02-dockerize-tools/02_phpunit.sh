#!/bin/bash

# Run PHPUnit
docker run -v $(pwd)/app:/app --rm phpunit/phpunit test