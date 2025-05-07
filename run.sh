#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Operating Systems Lab Experiments Runner${NC}\n"

# Function to compile and run C programs
compile_and_run() {
    local dir=$1
    local source_file=$2
    local experiment_name=$3
    
    echo -e "${GREEN}Running $experiment_name${NC}"
    cd "$dir" || return
    
    # Compile the C file
    if gcc "$source_file" -o "${source_file%.c}.out"; then
        echo "Compilation successful"
        # Run the program
        ./"${source_file%.c}.out"
    else
        echo "Compilation failed for $source_file"
    fi
    
    cd ..
    echo -e "\n-------------------------------------------\n"
}

# Experiment 4: Fork
compile_and_run "Experiment_4" "experiment4_fork.c" "Experiment 4: Process Management - Fork"

# Experiment 5: FCFS
compile_and_run "Experiment_5" "experiment5_fcfs.c" "Experiment 5: CPU Scheduling - FCFS"

# Experiment 6: SJF
compile_and_run "Experiment_6" "experiment6_sjf.c" "Experiment 6: CPU Scheduling - SJF"

# Experiment 7: Priority Scheduling
compile_and_run "Experiment_7" "experiment7_priority.c" "Experiment 7: Priority Scheduling"

# Experiment 8: Banker's Algorithm
compile_and_run "Experiment_8" "experiment8_bankers.c" "Experiment 8: Banker's Algorithm"

# Experiment 9: Basic Shell Programming
compile_and_run "Experiment_9" "experiment9_bash.c" "Experiment 9: Shell Programming Basics"

# Experiment 10: Advanced Shell Programming
echo -e "${GREEN}Running Experiment 10: Advanced Shell Programming${NC}"
cd Experiment_10
for file in experiment10_*.c; do
    if [ -f "$file" ]; then
        echo -e "\nCompiling and running $file"
        if gcc "$file" -o "${file%.c}.out"; then
            echo "Compilation successful"
            ./"${file%.c}.out"
        else
            echo "Compilation failed for $file"
        fi
    fi
done
cd ..

echo -e "\n${BLUE}All experiments completed!${NC}" 