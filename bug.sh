#!/bin/bash

# This script demonstrates a race condition.

counter=0

# Function to increment the counter
increment_counter() {
  local temp=$(($counter + 1))
  counter=$temp
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