# DBMS Practicals

This repository contains solutions to all the practicals performed in DBMS labs. Each practical demonstrates different SQL concepts and database operations.

## Repository Structure

The repository is organized as follows:
- `Practical_01/` - Basic SQL commands and table operations
- `Practical_02/` - Advanced SQL queries and joins
- `Practical_03/` - Subqueries and set operations
- `Practical_04/` - Views and indexes
- `Practical_05/` - Stored procedures and functions
- `Practical_06/` - PL/SQL programs (area, average, largest of three, swap)
- `Practical_07/` - PL/SQL loops (for and while)
- `Practical_08/` - Advanced PL/SQL concepts
- `Practical_09/` - Exception handling and triggers
- `Practical_10/` - Database connectivity with Java and Python

## Prerequisites

- MySQL Server
- MySQL Client
- Basic understanding of SQL and database concepts

## How to Run

1. Clone the repository:
```bash
git clone https://github.com/DevDhapodkar/DBMS-Practicals.git
cd DBMS-Practicals
```

2. Make the run script executable:
```bash
chmod +x run.sh
```

3. Run all practicals:
```bash
./run.sh
```

The script will:
- Create a database named `dbms_practicals`
- Execute all SQL files in sequence
- Show the output of each query

## Database Configuration

The script uses the following default configuration:
- Database Name: `dbms_practicals`
- Username: `root`
- Password: (empty by default)

To modify these settings, edit the `run.sh` file and update the following variables:
```bash
DB_NAME="dbms_practicals"
DB_USER="root"
DB_PASS=""
```

## Contributing

Feel free to submit issues and enhancement requests!
