**AdventureWorks BI Project**

**Overview**
End-to-end BI project based on the AdventureWorks database.

The goal was to create a structured data pipeline (SQL → Power BI) and deliver a clean, interactive dashboard.

**Data Preparation (SQL)**
The project uses two layers of views:

**RAW Layer** (vw_SalesSummary_raw.sql)
Views reflecting the source tables from AdventureWorks with minimal changes such as column selection and aliases.

**CLEAN Layer** (vw_SalesSummary_clean.sql)
Views standardized and prepared for reporting:

  ⦁	Joined SalesOrderHeader with SalesOrderDetail and Product.

  ⦁	Connected customer information from the Customer and Person tables.

  ⦁	Added calculated columns (for example, TotalLineAmount = UnitPrice * OrderQty).

  ⦁	Removed unused fields and renamed columns for readability.

To recreate the views, run the scripts with the AdventureWorks database installed.

Download AdventureWorks sample database: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure

**Data Modeling (Power BI)**

  ⦁	Created a Calendar table with CALENDAR and enriched it with Year, Month / Month Name, Day / Day Name and Quarter columns.

  ⦁	Created a Country table using Enter Data with CountryCode and CountryName.

  ⦁	Established relationships:
  
 	  - Sales to Calendar (OrderDate).
 	  - Sales to Country (CountryCode).

**Tools**

⦁	SQL Server – data extraction, cleaning, and view creation.

⦁	Power BI – data modeling, DAX measures, interactive dashboards.

⦁	Data Modeling – star schema with Calendar and Country dimensions.
