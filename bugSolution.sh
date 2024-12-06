#!/bin/bash

# This script demonstrates a solution to the race condition.

counter=0
lock_file="counter.lock"

# Function to increment the counter with locking
increment_counter() {
  flock $lock_file
  local temp=$(($counter + 1))
  counter=$temp
  echo "Counter incremented to: $counter" >> counter.log
  flock -u $lock_file
}

# Function to check the counter
check_counter() {
  echo "Counter value: $counter"
}

# Create two processes to increment the counter concurrently
pid1=$($BASH -c 'increment_counter' & echo $!) 
pid2=$($BASH -c 'increment_counter' & echo $!) 

# Wait for both processes to finish
wait $pid1 $pid2

# Check the final counter value
check_counter

# Cleanup the lock file
rm -f "$lock_file"