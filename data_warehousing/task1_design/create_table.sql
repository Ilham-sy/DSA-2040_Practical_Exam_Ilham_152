-- Product Dimension Table
CREATE TABLE Product_Dim (
    product_id SERIAL PRIMARY KEY,
    stock_code TEXT NOT NULL,
    description TEXT,
    category TEXT
);

-- Customer Dimension Table  
CREATE TABLE Customer_Dim (
    customer_id SERIAL PRIMARY KEY,
    customer_code TEXT NOT NULL,
    country TEXT,
    customer_segment TEXT
);

-- Time Dimension Table
CREATE TABLE Time_Dim (
    time_id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    day INTEGER,
    month INTEGER,
    quarter INTEGER,
    year INTEGER
);

-- Store/Region Dimension Table
CREATE TABLE Store_Dim (
    store_id SERIAL PRIMARY KEY,
    country TEXT NOT NULL,
    region TEXT
);

-- Sales Fact Table
CREATE TABLE Sales_Fact (
    sales_id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES Product_Dim(product_id),
    customer_id INTEGER REFERENCES Customer_Dim(customer_id),
    time_id INTEGER REFERENCES Time_Dim(time_id),
    store_id INTEGER REFERENCES Store_Dim(store_id),
    quantity INTEGER,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(10,2)
);