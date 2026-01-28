#!/bin/bash

# Check if running in API mode
if [ "$MODE" = "api" ]; then
    echo "Starting Apache in API mode..."
    # Start Apache in foreground
    source /etc/apache2/envvars
    exec apache2 -D FOREGROUND
else
    # CLI mode (original behavior)
    # If no arguments are passed to the container, execute a bash shell, else execute
    # pan-os-php and pass the arguments to it 
    
    if [[ -z $@ ]]
    then
        exec /bin/bash
    else
        exec php -r "require_once('/tools/pan-os-php/utils/pan-os-php.php');" "$@"
    fi
fi