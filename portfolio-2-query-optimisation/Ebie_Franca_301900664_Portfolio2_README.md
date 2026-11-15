# Portfolio 2 – Query Processing and Optimisation

**Course:** MIT 8103 – Advanced Database Systems  
**Academic Session:** 2026/2027  
**Case Study:** Greenfield University Student Results Management System  
**Database:** MySQL – `greenfield_university`

## 1. Aim

The aim of this portfolio is to examine query processing and optimisation techniques using the Greenfield University database. The activities involve executing SQL queries, analysing execution plans, evaluating index usage and comparing query performance.

## 2. Activities Performed

The following activities were completed:

1. Inspected existing database indexes using INFORMATION_SCHEMA.
2. Examined student registration records grouped by academic session and semester.
3. Generated a baseline execution plan using EXPLAIN.
4. Identified available course IDs for query testing.
5. Examined query execution plans using the composite index.
6. Examined query execution plans while ignoring the composite index.
7. Measured actual query performance using EXPLAIN ANALYZE.
8. Compared actual performance when using and ignoring the composite index.

## 3. Indexing and Query Optimisation

A composite index was evaluated using registration records filtered by course ID, academic session and semester.

The IGNORE INDEX clause was used to examine query execution without the specified composite index.

## 4. Performance Analysis

The actual execution results showed:

- Query using the composite-index-eligible query: approximately 0.098 ms.
- Query ignoring the composite index: approximately 0.364 ms.
- Both queries returned five records.

The results suggest faster execution in the first test. However, both execution plans showed a covering index scan using another available index. Therefore, the difference cannot be attributed exclusively to the composite index.

## 5. Evidence and Files

The following files provide evidence of the practical implementation:

- `Ebie_Franca_301900664_Portfolio2_SQL_Script.sql` – SQL queries and optimisation exercises.
- `Ebie_Franca_301900664_Portfolio2_Execution_Plans.png` – Execution plan screenshots.
- `Ebie_Franca_301900664_Portfolio2_Performance_With_Index.png` – Actual performance using the composite-index-eligible query.
- `Ebie_Franca_301900664_Portfolio2_Performance_Without_Index.png` – Actual performance while ignoring the composite index.

## 6. Conclusion

This exercise provided practical experience in SQL query execution, execution plan analysis and index evaluation. It demonstrated how MySQL uses available indexes when processing queries and how execution plans can help assess database performance.

The exercise also highlighted the importance of interpreting actual execution results rather than assuming that adding an index always improves performance.