#!/bin/bash

check_process() {
    if pgrep "$1" >/dev/null 2>&1; then
        echo "$1 is running."
    else
        echo "$1 is not running."
    fi
}

check_port() {
    if nc -z localhost "$1"; then
        echo "Port $1 is open."
    else
        echo "Port $1 is closed."
    fi
}

check_http_response() {
    response=$(curl -sL -w "%{http_code}" "http://localhost:$1" -o /dev/null)
    if [ "$response" == "200" ]; then
        echo "HTTP server on port $1 is reachable. Your application in up"
    else
        echo "HTTP server on port $1 is unreachable (HTTP status code $response)."
    fi
}

echo "Starting application health check..."

check_process "nginx"
check_port 80
check_http_response 8080

echo "Health check completed."