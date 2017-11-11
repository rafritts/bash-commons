#!/bin/bash

# This script will print a stack trace if any command sends the ERR signal to the shell, indicating a failure.

print_stacktrace() {
  local return_code="$?"
  error_message="Error in ${BASH_SOURCE[1]}:${BASH_LINENO[0]}. '${BASH_COMMAND}'"
  echo "${error_message}"
  log_fatal "${error_message}"
  log_fatal "Stacktrace:"
    for ((i=1;i<${#FUNCNAME[@]}-1;i++))
    do
      log_fatal "  $i: ${BASH_SOURCE[$i+1]}:${BASH_LINENO[$i]} ${FUNCNAME[$i]}()"
    done
  log_fatal "Exiting with status ${return_code}"
  exit "${return_code}"
}

trap 'print_stacktrace' ERR

set -eo errtrace