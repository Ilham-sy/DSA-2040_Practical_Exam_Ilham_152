## Section 1: Data Warehousing (50 Marks)

### Task 1: Data Warehouse Design (15 Marks)

**Scenario:**  
We are designing a data warehouse for a retail company that sells products across multiple categories (e.g., electronics, clothing). The company tracks **sales**, **customers**, **products**, and **time**.

The data warehouse must support queries such as:  
- Total sales by product category per quarter.  
- Customer demographics analysis.  
- Inventory trends.  

---

### 1. Star Schema Design

**Fact Table: `fact_sales`**  
- **Measures:**  
  - `sales_amount`  
  - `quantity`  
- **Foreign Keys:**  
  - `customer_id`  
  - `product_id`  
  - `time_id`  

**Dimension Tables:**

1. **`dim_customer`**  
   - `customer_id` (PK)  
   - `name`  
   - `location`  
   - `age_group`  

2. **`dim_product`**  
   - `product_id` (PK)  
   - `name`  
   - `category`  
   - `brand`  

3. **`dim_time`**  
   - `time_id` (PK)  
   - `date`  
   - `quarter`  
   - `year`  

📌 **Schema Diagram:**  
![Star Schema Diagram](data_warehousing/task1_design/schema_diagram.png)
---

### 2. Why Star Schema over Snowflake  
I chose star schema over snowflake because it provides better query performance through fewer joins, making it ideal for OLAP operations like roll-up and drill-down queries. Star schema also offers simpler maintenance and easier understanding for business users, while the slight data redundancy is acceptable given the performance benefits for analytical queries.

---

### 3. SQL CREATE TABLE Statements (SQLite)

```sql
-- Dimension Tables
CREATE TABLE CustomerDim (
    CustomerKey INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID VARCHAR(50) NOT NULL UNIQUE,
    CustomerName VARCHAR(100),
    CustomerCountry VARCHAR(100)
);

CREATE TABLE ProductDim (
    ProductKey INTEGER PRIMARY KEY AUTOINCREMENT,
    StockCode VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(255),
    Category VARCHAR(50)
);

CREATE TABLE TimeDim (
    TimeKey INTEGER PRIMARY KEY AUTOINCREMENT,
    FullDate DATE NOT NULL UNIQUE,
    DayOfMonth INTEGER,
    Month INTEGER,
    Quarter INTEGER,
    Year INTEGER
);

-- Fact Table
CREATE TABLE SalesFact (
    SalesFactKey INTEGER PRIMARY KEY AUTOINCREMENT,
    TimeKey INTEGER NOT NULL,
    ProductKey INTEGER NOT NULL,
    CustomerKey INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    UnitPrice REAL NOT NULL,
    TotalSales REAL NOT NULL,
    FOREIGN KEY (TimeKey) REFERENCES TimeDim(TimeKey),
    FOREIGN KEY (ProductKey) REFERENCES ProductDim(ProductKey),
    FOREIGN KEY (CustomerKey) REFERENCES CustomerDim(CustomerKey)
);
```

