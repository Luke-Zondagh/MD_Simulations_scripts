#!/bin/bash

# Function to check job status and wait until it's finished
wait_for_completion() {
    local job_id=$1
    while true; do
        # Check job status
        status=$(qstat $job_id 2>&1)
        # If the job isn't in the queue, it has finished
        if [[ $? -ne 0 ]]; then
            break
        fi
        # Sleep for a while before checking again
        sleep 60
    done
}

# Submit the first job and save the JobID as JOB_ONE
ONE=$(qsub 1_min_h_restrnt_MD.pbs)
# Wait for JOB_ONE to complete
wait_for_completion $ONE

# Submit the second job and save the JobID as JOB_TWO
TWO=$(qsub 2_equilibration_10K_MD.pbs)
# Wait for JOB_TWO to complete
wait_for_completion $TWO

# Submit the second job and save the JobID as JOB_TWO
THREE=$(qsub 3_9_min_MD.pbs)
# Wait for JOB_TWO to complete
wait_for_completion $THREE

# Submit the second job and save the JobID as JOB_TWO
FOUR=$(qsub 10_heating_100K_MD.pbs)
# Wait for JOB_TWO to complete
wait_for_completion $FOUR

# Submit the second job and save the JobID as JOB_TWO
qsub 11_18_MD.pbs  



