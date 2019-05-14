#!/bin/bash

set -o errexit

main() {
  setup_dependencies
  update_docker_configuration

  echo "SUCCESS:
  Done! Finished setting up Travis machine.
  "
}

setup_dependencies() {
  echo "INFO:
  Setting up dependencies.
  "

  sudo apt update -y
  sudo apt install --only-upgrade docker-ce -y
  docker info
}

update_docker_configuration() {
  echo "INFO:
  Updating docker configuration
  "

  echo '{
  "experimental": true
}' | sudo tee /etc/docker/daemon.json
  sudo service docker restart
}

main
