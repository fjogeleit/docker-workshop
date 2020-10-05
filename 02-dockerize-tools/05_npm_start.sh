#!/bin/bash

# Run NPM start with the PORT environment set to 8080 and a port binding from 8080 to local 80
docker run --rm -v $(pwd)/server:/app -e PORT=8080 -p 80:8080 bitnami/node npm start