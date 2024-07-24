list_users_last_login() {
    echo "Users and Last Login Times:"
    lastlog
    log "Listed users and their last login times"
}

show_user_details() {
    local username=$1
    echo "Details for user $username:"
    lastlog -u $username
    log "Displayed details for user $username"
}
