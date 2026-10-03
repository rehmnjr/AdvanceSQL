# Advanced SQL Joins Mastery

A comprehensive, hands-on database project designed to build a deep, structural understanding of relational database joins, query execution, and data retrieval strategies. 

**Repository:** [https://github.com/rehmnjr/AdvanceSQL.git](https://github.com/rehmnjr/AdvanceSQL.git)

---

## Project Overview

This project provides a robust testing ground for mastering SQL joins. Rather than using sterile, perfectly matched tables, this environment uses a carefully designed E-Commerce schema that mirrors real-world data anomalies. It includes null values, dangling foreign keys, and complex multi-table relationships to ensure a practical learning experience.

The repository is divided into three core learning modules:
1. **The Architecture:** A fully seeded 3-table relational database (150+ total records).
2. **The Practical Application:** 150 progressively difficult join queries.
3. **The Theoretical Foundation:** 30 hard-level interview questions focusing on query optimization and database internals.

---

## Database Architecture

The data model simulates a standard E-Commerce operations backend. 

### Schema Definition

*   **customers:** Tracks customer demographics, account statuses, and loyalty tiers.
    *   *Primary Key:* `customer_id`
*   **orders:** Tracks individual order records and metadata.
    *   *Primary Key:* `order_id`
    *   *Foreign Key:* `customer_id` (References `customers`)
*   **order_items:** Tracks specific line items within each transaction.
    *   *Primary Key:* `item_id`
    *   *Foreign Key:* `order_id` (References `orders`)

### Entity Relationship Mapping

```text
[ customers ] 1 -------- * [ orders ] 1 -------- * [ order_items ]
- customer_id (PK)         - order_id (PK)         - item_id (PK)
- first_name               - customer_id (FK)      - order_id (FK)
- email                    - order_date            - product_name
- customer_tier            - total_amount          - unit_price
```

*Note: The dataset intentionally includes unmatched foreign keys and null references to facilitate the testing of Outer, Cross, and Anti-joins.*

---

## Learning Modules

### 1. Structured Query Practice
The project includes a targeted list of 150 questions segmented by join methodology:

*   **Inner Joins:** Strict record matching across multiple tables.
*   **Left/Right Outer Joins:** Handling unmatched records, default values, and data gaps.
*   **Full Outer & Anti-Joins:** Complete table reconciliation and identifying orphaned records.
*   **Cross Joins:** Generating Cartesian products and data matrices.
*   **Self Joins:** Hierarchical data comparison within the same table.
*   **Complex Aggregations:** Multi-table joins combined with grouping and aggregate functions.

### 2. Technical Interview Preparation
A dedicated section containing 30 advanced, theory-based questions that cover:

*   Join execution algorithms (Nested Loop, Hash, Merge).
*   Handling Cartesian explosions and fan-out issues.
*   Query optimizer behavior and index utilization during joins.
*   Solving complex business logic without relying on subqueries.

---

## Setup Instructions

To deploy this environment locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/rehmnjr/AdvanceSQL.git
   ```
2. Open your preferred SQL client (MySQL Workbench, DBeaver, DataGrip, or CLI).
3. Execute the schema generation script to build the tables.
4. Execute the data insertion script to populate the 150+ records.
5. Begin querying the database using the provided practice questions.

---

*Maintained by rehmnjr.*