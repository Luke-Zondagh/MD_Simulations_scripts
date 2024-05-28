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
ONE=$(qsub 19_production_MD_r1.pbs)
# Wait for JOB_ONE to complete
wait_for_completion $ONE

# Submit the second job and save the JobID as JOB_TWO
TWO=$(qsub 19_production_MD_r2.pbs)
 Wait for JOB_TWO to complete
wait_for_completion $TWO

# Submit the second job and save the JobID as JOB_TWO
THREE=$(qsub 19_production_MD_r3.pbs)
# Wait for JOB_TWO to complete
wait_for_completion $THREE

# Submit the second job and save the JobID as JOB_TWO
FOUR=$(qsub 19_production_MD_r4.pbs)
# Wait for JOB_TWO to complete
wait_for_completion $FOUR

# Submit the first job and save the JobID as JOB_ONE
FIVE=$(qsub 19_production_MD_r5.pbs)
# Wait for JOB_ONE to complete
wait_for_completion $FIVE

# Submit the first job and save the JobID as JOB_ONE
SIX=$(qsub 19_production_MD_r6.pbs)
# Wait for JOB_ONE to complete
wait_for_completion $SIX

# Submit the first job and save the JobID as JOB_ONE
SEVEN=$(qsub 19_production_MD_r7.pbs)
# Wait for JOB_ONE to complete
wait_for_completion $SEVEN

# Submit the first job and save the JobID as JOB_ONE
EIGHT=$(qsub 19_production_MD_r8.pbs)
# Wait for JOB_ONE to complete
wait_for_completion $EIGHT

# Submit the first job and save the JobID as JOB_ONE
NINE=$(qsub 19_production_MD_r9.pbs)
# Wait for JOB_ONE to complete
wait_for_completion $NINE

# Submit the second job and save the JobID as JOB_TWO
qsub 19_production_MD_r_10.pbs  



