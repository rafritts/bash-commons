#!/bin/bash

source ../bash_commons.sh

some_function() {
    log_debug "debug message"
    some_function_2
}

some_function_2() {
    log_info "info message"
    some_function_3
}

some_function_3() {
    log_warn "warn message"
    some_function_4
}

some_function_4() {
    log_error "error message"
    some_function_5
}

some_function_5() {
    log_fatal "fatal message - This is an intentional error"
    cat someFile.txt
}

some_function