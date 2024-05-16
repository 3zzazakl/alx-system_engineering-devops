#!/usr/bin/env bash
# Reload gunicorn without downtime
worker_pids=$(pgrep -f gunicorn)

for pid in $worker_pids 
do
    echo "Relaoding worker $pid"
    kill -HUP "$pid"
    sleep 1
done

echo "Reloading master"
