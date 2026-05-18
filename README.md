
Project Title - ITSM Incident Analytics — dbt + DuckDB

Description - End-to-end analytics engineering project transforming raw ITSM incident event log data into business-ready fact and dimension tables using dbt Core and DuckDB.

Architecture
<img width="2833" height="1390" alt="image" src="https://github.com/user-attachments/assets/346299d5-19f2-4bcf-88b6-de148e760fdd" />

## What it covers
- Layered architecture — staging, intermediate, marts
- Star schema — fact and dimension tables
- Incremental models
- Data quality testing — 14 tests
- Macros for reusable transformations
- Snapshots for SCD Type 2 tracking
- Seeds for reference data
- dbt packages

## Tech Stack
- dbt Core 1.11
- DuckDB
- Python
- Git

## How to Run

1. Clone the repo
2. Create virtual environment
3. `pip install dbt-core dbt-duckdb`
4. Configure `profiles.yml`
5. Run `dbt seed`, `dbt run`, `dbt test`
