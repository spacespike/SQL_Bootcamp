# 🏛️ School 21: SQL Bootcamp

A comprehensive, intensive database track focused on relational algebra, query optimization, transaction management, and algorithmic problem-solving using **PostgreSQL**.

---

## 🚀 Overview

This repository contains my solutions for the School 21 SQL Boot Camp track. The curriculum covers foundational data retrieval, deep dives into relational database theory, data architecture evolution, concurrency management, and building automated database blocks.

---

## 🛠️ Tech Stack & Tools

* **Database Engine:** PostgreSQL
* **Tools Used:** pgAdmin, VSCode, DBeaver, CLI (psql)
* **SQL Dialect:** ANSI SQL, PL/pgSQL

---

## 📅 Project Structure

### 👤 Individual Modules

| Module | Topic | Core Focus |
| :--- | :--- | :--- |
| **`SQLB1`** | **Basics** | Inner subqueries in `FROM`/`SELECT` clauses, date filtering, and multi-field sorting. |
| **`SQLB2`** | **Retrieving data** | Set operators (`UNION`, `INTERSECT`, `EXCEPT`), table joins, and finding data anomalies. |
| **`SQLB3`** | **Retrieving data deep dive** | Relational algebra, complex `JOIN` variations, Common Table Expressions (CTEs), and `NULL` handling. |
| **`SQLB4`** | **DML** | Data Modification Language (`INSERT`, `UPDATE`, `DELETE`) and inventory/reporting calculations. |
| **`SQLB5`** | **Snapshots** |Creating Virtual Views, handling missing dates, and managing/refreshing Materialized Views. |
| **`SQLB7`** | **Database index** |Implementation strategies, execution profiling (`EXPLAIN ANALYZE`), performance optimization and B-Tree scan mechanisms. |
| **`SQLB8`** | **Integrating features** | Schema evolution, database normalization, and integrating new business logic into data models. |
| **`SQLB9`** | **OLAP** | Transform raw transactional layers into structured reports using data aggregation and conditional logic, `GROUP BY`. |
| **`SQLB10`** | **Isolation levels** | Concurrency control, managing transaction blocks, and preventing anomalies (dirty reads, phantom reads). |
| **`SQLB11`** | **Functions and procs** | Writing procedural database logic using native stored procedures, custom functions, and triggers. |

### 👥 Team Projects
| Module | Topic | Core Focus |
| :--- | :--- | :--- |
| **`SQLB6`** | **Salesman problem** | Modeling graphs/routes using **Recursive CTEs** to solve the Traveling Salesman Problem (TSP) and compute the absolute shortest path between multiple destinations. |  
| **`SQLB12`** | **Warehouse fundamentals** | 🟦 *Upcoming* Introduction to Data Warehouses (DWH) and building automated Extract, Transform, Load (ETL) pipelines. |

---

## 💡 Key Takeaways & Core Competencies

* **Advanced Data Engineering & Retrieval**
  * Mastered relational algebra, table joins (`INNER`, `LEFT`, `RIGHT`, `FULL OUTER`, `CROSS`), and set operators (`UNION`, `INTERSECT`, `EXCEPT`) to find data intersections and isolate anomalies.
  * Solved complex, graph-based algorithmic problems (like the **Traveling Salesman Problem**) inside the database engine using advanced features like **Recursive CTEs**.

* **OLAP & Business Intelligence Reporting**
  * Learned to bridge the gap between transactional (OLTP) and analytical (OLAP) layers by transforming noisy, raw logs into clean, multi-dimensional business reports.
  * Specialized in heavy data aggregations, dynamic conditional logic, and explicit data type transformations (`::numeric`) to compute critical performance metrics.

* **Database Optimization & Indexing**
  * Learned how to read and diagnose slow queries using execution profiles (`EXPLAIN ANALYZE`).
  * Gained a practical understanding of when and how to implement B-Tree indexes to optimize query evaluation speeds and fix system bottlenecks.

* **Schema Evolution & Lifecycle Management**
  * Handled system changes by altering live database schemas to introduce new features without destroying data integrity.
  * Utilized Virtual Views for security and abstraction, and deployed Materialized Views to cache heavy computational snapshots for high-speed reporting.

* **Concurrency & Procedural Programming**
  * Handled concurrent multi-user environments by manipulating **Transaction Isolation Levels**, understanding database locks, and actively preventing anomalies like dirty reads, non-repeatable reads, and phantom reads.
  * Shifted complex business logic from backend applications into the data layer by writing customized, automated **PL/pgSQL functions, stored procedures, and database triggers**.

* **DWH & ETL Pipeline Architecture**
  * Developed foundational skills in Data Warehousing (DWH) paradigms and structured automated Extract, Transform, Load (ETL) routines to clean, consolidate, and process anomalous transactional data at scale.
  * Engineered a mini Data Warehouse infrastructure. Designed an Extract, Transform, Load pipeline to ingest, clean, and normalize anomalous transactional financial logs.
---
