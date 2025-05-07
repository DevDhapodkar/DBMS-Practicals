#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Operating Systems Lab Experiments Runner${NC}\n"

# Check if MySQL is installed
if ! command -v mysql &> /dev/null; then
    echo -e "${RED}MySQL is not installed. Please install MySQL first.${NC}"
    exit 1
fi

# Database configuration
DB_NAME="dbms_practicals"
DB_USER="root"
DB_PASS=""

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

# Function to run SQL file
run_sql_file() {
    local file=$1
    echo -e "\n${BLUE}Running $file...${NC}"
    echo -e "${GREEN}----------------------------------------${NC}"
    
    if [ -z "$DB_PASS" ]; then
        mysql -u "$DB_USER" "$DB_NAME" < "$file"
    else
        mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$file"
    fi
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Successfully executed $file${NC}"
    else
        echo -e "${RED}Error executing $file${NC}"
    fi
    echo -e "${GREEN}----------------------------------------${NC}"
}

# Create database if it doesn't exist
echo -e "${BLUE}Creating database if it doesn't exist...${NC}"
if [ -z "$DB_PASS" ]; then
    mysql -u "$DB_USER" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
else
    mysql -u "$DB_USER" -p"$DB_PASS" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
fi

# Run all SQL files in Practical folders
for dir in Practical_*/; do
    if [ -d "$dir" ]; then
        echo -e "\n${BLUE}Processing directory: $dir${NC}"
        for file in "$dir"*.sql; do
            if [ -f "$file" ]; then
                run_sql_file "$file"
            fi
        done
    fi
done

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
echo -e "\n${GREEN}All SQL files have been executed!${NC}" 