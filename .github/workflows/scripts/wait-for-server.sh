#!/bin/bash
max_retries=5

for (( i=0; i<max_retries; i++ )); do
  if ! nc -z localhost 8065; then
    echo "localhost:8065 is not up yet..."
    sleep 10
  else
    echo "localhost:8065 is up!"
    break
  fi
done

if [[ $i -eq $max_retries ]]; then
  echo "localhost:8065 is still not up!"
fi