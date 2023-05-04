1. What is SQL?
1. SQL stands for Structured query language. It is a programming language for storing and processing information in a relational database. A relational database stores information in tabular form, with rows and columns representing different data attributes and the various relationships between the data values. SQL uses statements to store, update, remove, search, and retrieve information from the database. It can also maintain and optimize database performance. SQL was invented in the 1970s based on the relational data model. It was initially known as the structured English query language (SEQUEL). 


2. Different database management softwares?
2. A Database is a systematic collection of data which supports storage and manipulation of information and it is usually managed by a Database Management System (DBMS). Data within a database is typically modeled in rows and columns in tables to make data querying and processing more efficient.
	1. Microsoft SQL: SQL Server is RDBMS developed by Microsoft.
	2. Database Performance Analyzer: SolarWinds Database Performance Analyzer is performance monitoring and analysis tool for database admin
	3. MySQL: MySQL is an open-source relational database
	4. PostgreSQL: PostgreSQL is an enterprise-class open source database management system. It is one of the best free databases that supports both SQL for relational and JSON for non-relational queries.
	5. MongoDB: MongoDB is a document-oriented NoSQL database used for high volume data storage. It is an open source database.
	6. OrientDB: OrientDB is an open-source NoSQL multi-model database which helps organizations to unlock the power of graph databases without deploying multiple systems to handle other data types.
	7. MariaDB: MariaDB is a fork of the MySQL database management system. It is created by its original developers. This DBMS tool provides data processing capabilities for both small and enterprise tasks.
	8. SQLite: SQLite is an open-source, embedded, relational database management system, designed circa 2000. It is a database, with zero configuration, no requirements of a server or installation. Despite its simplicity, it is laden with popular features of database management systems.
	9. Cassandra: Cassandra is a free tool which is designed to manage a large amount of data across a wide range of servers. The tool offers support for replicating across multiple datacenters.
	10. CouchDB: CouchDB is open-source software that is based on the common standards to access your important data. It stores data on your server or with a leading service provider of your choice.
	11. Oracle: Oracle is self-repairing, self-securing, and self-driving designed to eliminate manual data management. It is an intelligent, secure, and highly available database in the cloud that helps you to grow your business.
	12. DynamoDB: Amazon DynamoDB is a nonrelational database. This database system provides consistent latency and offers built-in security and in-memory caching. DynamoDB is a serverless database which scales automatically and backs up your data for protection.
	13. Neo4j: Neo4j is an open-source NoSQL graph database, implemented in Java. It saves your data in graphs rather than in tables.
	14. Firebirdsql: Firebird is an open-source SQL RDBMS that runs on, Microsoft Windows, macOS, Linux, and several Unix platforms.


3. What are the components of a SQL system?
3. Components are:
	1. SQL table: A SQL table is the basic element of a relational database. The SQL database table consists of rows and columns.
	2. SQL statements: SQL statements, or SQL queries, are valid instructions that relational database management systems understand. Software developers build SQL statements by using different SQL language elements. SQL language elements are components such as identifiers, variables, and search conditions that form a correct SQL statement.
	3. Stored procedures: Stored procedures are a collection of one or more SQL statements stored in the relational database. Software developers use stored procedures to improve efficiency and performance.


4. How does SQL work?
4. Structured query language (SQL) implementation involves a server machine that processes the database queries and returns the results. The SQL process goes through several software components, including the following. 
	1. Parser: The parser starts by tokenizing, or replacing, some of the words in the SQL statement with special symbols. It then checks the statement for the following:
	2. Correctness: The parser verifies that the SQL statement conforms to SQL semantics, or rules, that ensure the correctness of the query statement. For example, the parser checks if the SQL command ends with a semi-colon. If the semi-colon is missing, the parser returns an error.
	3. Authorization: The parser also validates that the user running the query has the necessary authorization to manipulate the respective data. For example, only admin users might have the right to delete data. 
	4. Relational engine: The relational engine, or query processor, creates a plan for retrieving, writing, or updating the corresponding data in the most effective manner.
	5. Storage engine: The storage engine, or database engine, is the software component that processes the byte code and runs the intended SQL statement. It reads and stores the data in the database files on physical disk storage. Upon completion, the storage engine returns the result to the requesting application.

5. What are SQL commands?
5. Structured query language (SQL) commands are specific keywords or SQL statements that developers use to manipulate the data stored in a relational database. You can categorize SQL commands as follows.
	1. Data definition language (DDL) refers to SQL commands that design the database structure. Database engineers use DDL to create and modify database objects based on the business requirements. For example, the database engineer uses the CREATE command to create database objects such as tables, views, and indexes.
	2. Data query language (DQL) consists of instructions for retrieving data stored in relational databases. Software applications use the SELECT command to filter and return specific results from a SQL table. 
	3. Data manipulation language (DML) statements write new information or modify existing records in a relational database. For example, an application uses the INSERT command to store a new record in the database.
	4. Database administrators use data control language (DCL) to manage or authorize database access for other users. For example, they can use the GRANT command to permit certain applications to manipulate one or more tables. 
	5. The relational engine uses transaction control language (TCL) to automatically make database changes. For example, the database uses the ROLLBACK command to undo an erroneous transaction.