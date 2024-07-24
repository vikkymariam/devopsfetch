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
