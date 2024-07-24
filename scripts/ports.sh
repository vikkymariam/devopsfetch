show_active_ports() {
    echo "Active Ports and Services:"
    netstat -tuln | awk 'NR>2 {print $1, $4, $6}'
    log "Displayed active ports and services"
}

show_port_details() {
    local port=$1
    echo "Details for port $port:"
    netstat -tuln | grep ":$port"
    log "Displayed details for port $port"
}
