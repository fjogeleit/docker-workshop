#!/bin/bash

# Run NPM install for the server example
docker run --rm -v $(pwd)/server:/app bitnami/node npm install