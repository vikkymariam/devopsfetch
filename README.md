README.md
DevOps Fetch
Overview
DevOps Fetch (devopsfetch) is a tool designed to collect and display system information, including active ports, user logins, Nginx configurations, Docker images, and container statuses. It can also monitor and log these activities continuously.

Installation
Follow these steps to install necessary dependencies and set up the systemd service:

Clone the repository:

```bash
git clone <repository_url>
cd devopsfetch
```
Run the installation script:

```bash
./install.sh
```
The installation script will:

Update package lists.
Install necessary dependencies (net-tools, docker.io, and nginx).
Set up a systemd service for continuous monitoring.
Set up log rotation.
Usage
Once installed, you can use the devopsfetch script with various options to fetch specific system information.

Command-Line Flags
-p, --port [port_number]: Display active ports or detailed info about a specific port.
Example: ./devopsfetch.sh -p or ./devopsfetch.sh --port 80
-d, --docker [container]: List Docker images/containers or detailed info about a specific container.
Example: ./devopsfetch.sh -d or ./devopsfetch.sh --docker container_name
-n, --nginx [domain]: List Nginx domains/ports or detailed config for a specific domain.
Example: ./devopsfetch.sh -n or ./devopsfetch.sh --nginx example.com
-u, --users [username]: List users and their last login times or detailed info about a specific user.
Example: ./devopsfetch.sh -u or ./devopsfetch.sh --users username
-t, --time [time_range]: Display activities within a specified time range.
Example: ./devopsfetch.sh -t 1h or ./devopsfetch.sh --time 1d
-h, --help: Show help message with usage instructions.
Example: ./devopsfetch.sh -h or ./devopsfetch.sh --help
Examples
Display Active Ports
```bash
./devopsfetch.sh -p
```
Display Details for Port 80
```bash
./devopsfetch.sh -p 80
```
List Docker Images and Containers
```bash
./devopsfetch.sh -d
```
Display Details for a Docker Container
```bash
./devopsfetch.sh -d container_name
```
List Nginx Domains and Ports
```bash
./devopsfetch.sh -n
```
Display Details for a Specific Nginx Domain
```bash
./devopsfetch.sh -n example.com
```
List Users and Their Last Login Times
```bash
./devopsfetch.sh -u
```
Display Details for a Specific User
```bash
./devopsfetch.sh -u username
```
Display Activities Within the Last Hour
```bash
./devopsfetch.sh -t 1h
```
Logging Mechanism
The script logs activities to ./logs/devopsfetch.log. Log rotation is configured to manage the log files efficiently.

Retrieving Logs
To view the logs, you can use:

```bash
cat ./logs/devopsfetch.log
```
Logs are rotated daily and compressed. The default configuration keeps 14 days of logs.

Help and Documentation
Use the help flag -h or --help to get usage instructions for the program.

```bash
./devopsfetch.sh -h
```
Contributing
If you would like to contribute to this project, please fork the repository and submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

License
MIT

This detailed README.md provides comprehensive documentation covering installation, usage, examples, and logging for the devopsfetch tool.