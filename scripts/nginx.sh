list_nginx_domains_ports() {
    echo "Nginx Domains and Ports:"
    grep 'server_name' /etc/nginx/sites-enabled/* -r
    log "Listed Nginx domains and ports"
}

show_nginx_domain_details() {
    local domain=$1
    echo "Configuration for domain $domain:"
    grep -r "server_name .*${domain}" /etc/nginx/sites-enabled/
    log "Displayed configuration for domain $domain"
}
