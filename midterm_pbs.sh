#!/bin/bash
### script to run 3 serial jobs using  4 cores on htc using queue windfall or standard
### Set the job name
#PBS -N acic_inaturalist_data

### Specify the PI group for this job
### List of PI groups available to each user can be found with "va" command
#PBS -W group_list=nirav

### Set the queue for this job as windfall or standard (adjust ### and #)
###PBS -q standard
#PBS -q windfall

### Request email when job begins and ends - commented out in this case
# PBS -m bea

### Specify email address to use for notification - commented out in this case
# PBS -M jhanson3@email.arizona.edu

### Set the number of cores and memory that will be used for this job
### select=1 is the node count, ncpus=4 are the cores in each node, 
### mem=4gb is memory per node, pcmem=6gb is the memory per core - optional
#PBS -l select=1:ncpus=4:mem=24gb:pcmem=6gb

### Specify "wallclock time" required for this job, hhh:mm:ss
#PBS -l walltime=01:00:00

### Specify total cpu time required for this job, hhh:mm:ss
### total cputime = walltime * ncpus
#PBS -l cput=4:00:00

module load R

### cd: set directory for job execution, ~netid = home directory path
### executable command with trailing &. Do NOT assign more resources than the node has.
### Each iteration below will consume memory and cpu. 

cd ~jhanson3/project/repo/midterm/hpc
date
Rscript data_setup.R
date

