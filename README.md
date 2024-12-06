# Bash Script Race Condition
This repository demonstrates a race condition in a bash script.  Two processes attempt to increment a shared counter concurrently, resulting in an incorrect final count due to the lack of proper synchronization.

## Bug Description
The `bug.sh` script showcases a race condition where the `counter` variable is updated by two processes simultaneously.  The lack of atomicity in the increment operation can lead to a final count that is less than expected (not necessarily 2).

## Solution
The `bugSolution.sh` script demonstrates how to resolve the race condition using a lock file to ensure that only one process can access and update the counter at a time.