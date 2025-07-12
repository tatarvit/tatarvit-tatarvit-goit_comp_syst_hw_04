#!/bin/bash

websites=("https://google.com" "https://facebook.com" "https://twitter.com")
log_file="website_status.log"

> "$log_file"

for site in "${websites[@]}"; do
    http_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$site")
    if [ "$http_code" -eq 200 ]; then
        echo "[<${site}>](<${site}/>) is UP" >> "$log_file"
    else
        echo "[<${site}>](<${site}/>) is DOWN" >> "$log_file"
    fi
done

echo "Результати записано у файл $log_file"

