# 

#!/bin/bash

# Define the log file path
LOG_FILE="./logs/devopsfetch.log"

# Function to log messages
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}

# Function to display help
show_help() {
    echo "Usage: devopsfetch.sh [options]
Options:
    -p, --port [port_number]     Display active ports or detailed info about a specific port.
    -d, --docker [container]     List Docker images/containers or detailed info about a specific container.
    -n, --nginx [domain]         List Nginx domains/ports or detailed config for a specific domain.
    -u, --users [username]       List users and their last login times or detailed info about a specific user.
    -t, --time [time_range]      Display activities within a specified time range.
    -h, --help                   Show this help message."
    log "Displayed help"
}

# Include utility scripts
source ./scripts/ports.sh
source ./scripts/docker.sh
source ./scripts/nginx.sh
source ./scripts/users.sh
source ./scripts/time.sh
source ./scripts/help.sh

# Main script logic
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -p|--port)
            shift
            if [[ "$1" =~ ^[0-9]+$ ]]; then
                show_port_details "$1"
            else
                show_active_ports
            fi
            ;;
        -d|--docker)
            shift
            if [[ -n "$1" ]]; then
                show_docker_container_details "$1"
            else
                list_docker_images_containers
            fi
            ;;
        -n|--nginx)
            shift
            if [[ -n "$1" ]]; then
                show_nginx_domain_details "$1"
            else
                list_nginx_domains_ports
            fi
            ;;
        -u|--users)
            shift
            if [[ -n "$1" ]]; then
                show_user_details "$1"
            else
                list_users_last_login
            fi
            ;;
        -t|--time)
            shift
            if [[ -n "$1" ]]; then
                show_activities_within_time_range "$1"
            else
                echo "Error: Please provide a time range."
                log "Error: Missing time range for --time option"
                exit 1
            fi
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "Error: Unknown parameter passed: $1"
            show_help
            log "Error: Unknown parameter passed: $1"
            exit 1
            ;;
    esac
    shift
done

# If no arguments are provided, display help
if [[ "$#" -eq 0 ]]; then
    show_help
    exit 1
fi
