list_docker_images_containers() {
    echo "Docker Images:"
    docker images
    echo "Docker Containers:"
    docker ps -a
    log "Listed Docker images and containers"
}

show_docker_container_details() {
    local container=$1
    echo "Details for Docker container $container:"
    docker inspect $container
    log "Displayed details for Docker container $container"
}
