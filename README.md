# Dummy Database Project

## Project Overview

This project contains SQL scripts to create a basic database structure with tables for departments, employees, and salaries. It includes sample data and queries to showcase typical operations you might perform on this database.

## Table of Contents

- [Project Overview](#project-overview)
- [Setup Instructions](#setup-instructions)
- [Database Structure](#database-structure)
  - [Departments Table](#departments-table)
  - [Employees Table](#employees-table)
  - [Salaries Table](#salaries-table)
- [Sample Queries](#sample-queries)
- [Usage](#usage)
- [License](#license)

## Setup Instructions

1. Clone or download the repository to your local machine.
2. Open your SQL database management tool (e.g., MySQL Workbench, Oracle SQL Developer).
3. Run the `dummy_database.sql` script to create tables and populate sample data.

## Database Structure

### Departments Table

The `Departments` table contains department information.

| Column        | Type          | Description                  |
|---------------|---------------|------------------------------|
| DepartmentID  | INT           | Primary key for departments. |
| DepartmentName| VARCHAR(50)   | Name of the department.      |

### Employees Table

The `Employees` table stores employee details and references departments.

| Column        | Type          | Description                             |
|---------------|---------------|-----------------------------------------|
| EmployeeID    | INT           | Primary key for employees.              |
| FirstName     | VARCHAR(50)   | Employee's first name.                  |
| LastName      | VARCHAR(50)   | Employee's last name.                   |
| DepartmentID  | INT           | Foreign key referencing Departments.    |
| HireDate      | DATE          | Employee's hire date.                   |

### Salaries Table

The `Salaries` table stores salary information for employees.

| Column        | Type          | Description                             |
|---------------|---------------|-----------------------------------------|
| EmployeeID    | INT           | Foreign key referencing Employees.      |
| Salary        | DECIMAL(10, 2)| Employee's salary amount.               |
| EffectiveDate | DATE          | Date when the salary took effect.       |

## Sample Queries

Here are some sample queries to help you get started:

1. **List all employees with department names:**
   ```sql
   SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName, e.HireDate
   FROM Employees e
   JOIN Departments d ON e.DepartmentID = d.DepartmentID;
