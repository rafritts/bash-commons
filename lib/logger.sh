#!/bin/bash

date=$(date '+%Y%m%d')
SCRIPT_NAME="$0"
LOG_FILE="${SCRIPT_NAME}-${date}.log"

if [ ! -d logs ]; then
    mkdir logs
fi

__log_message() {
    log_level="$1"
    message="$2"
    log_message="$(date '+%Y-%m-%d %H:%M:%S') ${log_level} - ${SCRIPT_NAME}:${LINENO} - ${message}"
    echo -e "${log_message}" >> "${LOG_FILE}"
}

log_debug() {
    __log_message "DEBUG" "$1"
}

log_info() {
    __log_message "INFO " "$1"
}

log_warn() {
    __log_message "WARN " "$1"
}

log_error() {
    __log_message "ERROR" "$1"
}

log_fatal() {
    __log_message "FATAL" "$1"
}

