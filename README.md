# Polling System Database

## Overview

This SQL script sets up a database for a polling system. It includes the creation of tables for voters, administrators, polling officers, and candidates, and provides sample data to demonstrate how the database can be used. The script also includes transactions for common operations such as adding new voters, updating passwords, and retrieving voting results.

## Database Setup

### Prerequisites

- SQL Server or a compatible database management system.
- SQL Server Management Studio or another SQL query tool.

### Steps to Set Up

1. Open your SQL query tool.
2. Copy and paste the entire script into the query window.
3. Execute the script to create the `polling_system` database and its tables, and to insert sample data.

## Script Breakdown

- **Database and Table Creation**: The script starts by creating a new database called `polling_system` and then defines four tables: `voters`, `admins`, `polling_officers`, and `candidates`.

- **Inserting Sample Data**: The script populates these tables with sample data, demonstrating the structure and type of data each table will hold.

- **Transactions for Common Operations**:
  - **Adding New Voters**: Demonstrates how to add a new record to the `voters` table.
  - **Updating Passwords**: Shows how to update the password for a voter and a polling officer.
  - **Deleting a Voter**: Provides an example of how to remove a voter from the `voters` table.
  - **Retrieving Voting Results**: Includes queries to fetch the top candidates by votes, the candidate with the least votes, and the name of the winner.
  - **Clearing Candidates**: Shows how to delete all records from the `candidates` table.

## Contributing

This project is a basic template for a polling system database. Contributions for enhancements and optimizations are welcome. Please follow the standard process of forking the repository, making changes, and submitting a pull request.

## License

This script is open-source and free to use or modify as needed for personal or commercial purposes.
