Netflix Data Analysis using PostgreSQL
Project Overview

This project focuses on analyzing Netflix movies and TV shows data using SQL in PostgreSQL.
The objective of this analysis is to explore content trends, understand viewer classifications, identify top-performing categories, and practice real-world SQL data analysis techniques.

The project includes:

Data Cleaning
Exploratory Data Analysis (EDA)
Business Insight Generation
Advanced SQL Queries
Window Functions
Ranking Analysis
Dataset

Dataset used: Netflix Movies and TV Shows Dataset

Source:
Netflix Dataset on Kaggle

Dataset contains information such as:

Show ID
Title
Type (Movie / TV Show)
Director
Cast
Country
Date Added
Release Year
Rating
Duration
Genre
Description
Tools & Technologies Used
PostgreSQL
pgAdmin
SQL
Window Functions
Aggregate Functions
Database Setup
Create Database
CREATE DATABASE netflix_analysis;
Create Table
CREATE TABLE netflix (
    show_id VARCHAR(10),
    type VARCHAR(20),
    title TEXT,
    director TEXT,
    cast TEXT,
    country TEXT,
    date_added TEXT,
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(20),
    listed_in TEXT,
    description TEXT
);
Key Analysis Performed
1. Movies vs TV Shows Analysis
Counted total number of Movies and TV Shows available on Netflix.
Compared content distribution by type.
2. Ratings Analysis
Identified the most common ratings for Movies and TV Shows.
Used Window Functions and Ranking techniques.

Example query:

SELECT *
FROM
(
    SELECT
        type,
        rating,
        COUNT(*) AS total_count,
        RANK() OVER (
            PARTITION BY type
            ORDER BY COUNT(*) DESC
        ) AS ranking
    FROM netflix
    GROUP BY type, rating
) AS t1
WHERE ranking = 1;
3. Content Release Trend
Analyzed how Netflix content increased over the years.
Identified peak content release years.
4. Top Producing Countries
Found countries producing the highest Netflix content.
5. Genre Analysis
Analyzed the most popular genres/categories on Netflix.
6. Director Analysis
Identified directors with the highest number of titles on Netflix.
7. Duration Analysis
Found longest movies and analyzed average duration trends.
SQL Concepts Used

This project demonstrates practical usage of:

SELECT Statements
WHERE Clause
GROUP BY
ORDER BY
Aggregate Functions
CASE WHEN
Subqueries
Common Table Expressions (CTEs)
Window Functions
RANK()
PARTITION BY
Data Cleaning Techniques
Business Insights Generated

Some important insights from the analysis:

Movies dominate Netflix content compared to TV Shows.
Certain ratings such as TV-MA appear most frequently.
Content production significantly increased after 2015.
The United States contributes the largest amount of Netflix content.
Drama and Comedy are among the most popular genres.
Learning Outcomes

Through this project, I improved my understanding of:

SQL querying
Database management
Data analysis techniques
Window functions
Real-world business problem solving
Analytical thinking
Future Improvements

Possible future enhancements for this project:

Connect PostgreSQL with Power BI
Build interactive dashboards
Perform sentiment analysis on descriptions
Create recommendation systems using Python
Automate reporting workflows
Project Structure
Netflix-Analysis/
│
├── netflix_titles.csv
├── Netflix_Analysis.sql
├── README.md
Conclusion

This project helped in gaining hands-on experience with SQL and data analysis using real-world Netflix data. It also strengthened understanding of analytical queries, ranking functions, and extracting meaningful business insights from structured datasets.

Author

Mohd Riyaz
