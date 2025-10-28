#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
cd "$SCRIPT_DIR" || { echo "can't change directory to $SCRIPT_DIR. Aborting."; exit 1; }
MASTER_STATUS=0

run_test() {
    local script_name="$1"
    echo "executing $script_name"
    "./$script_name"
    local status=$?
    
    if [ $status -ne 0 ]; then
        echo "$script_name - error (Exit Code $status)"
        MASTER_STATUS=1
    else
        echo "$script_name - success"
    fi
    echo ""
}

run_test "json_check_uniques.sh"
run_test "json_validate_card_abilities.bash"

if [ $MASTER_STATUS -eq 0 ]; then
    echo "All JSON tests passed."
else
    echo "One or more JSON tests failed."
fi

exit $MASTER_STATUS
