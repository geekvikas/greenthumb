-- Customers table
CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE NOT NULL,
    customer_tier VARCHAR(20) DEFAULT 'bronze', -- bronze, silver, gold
    city VARCHAR(50),
    state VARCHAR(2)
);

-- Products table  
CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL, -- seeds, tools, fertilizers, planters, pest_control
    price DECIMAL(10,2) NOT NULL,
    seasonal BOOLEAN DEFAULT FALSE,
    supplier_id INTEGER
);

-- Orders table
CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'completed', -- completed, pending, cancelled
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Order items table
CREATE TABLE order_items (
    id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Suppliers table
CREATE TABLE suppliers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    rating DECIMAL(3,2) -- 1.00 to 5.00
);