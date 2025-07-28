-- GreenThumb Garden Supplies - Database Seed Data

-- Insert Suppliers
INSERT INTO suppliers (id, name, location, rating) VALUES
(1, 'Heritage Seeds Co.', 'Portland, OR', 4.8),
(2, 'GardenPro Tools', 'Nashville, TN', 4.5),
(3, 'Organic Growth Solutions', 'Sacramento, CA', 4.7),
(4, 'Terra Cotta Creations', 'Austin, TX', 4.3),
(5, 'Natural Pest Defense', 'Denver, CO', 4.6);

-- Insert Products
INSERT INTO products (id, name, category, price, seasonal, supplier_id) VALUES
-- Seeds (seasonal = spring/summer focus)
(1, 'Heirloom Tomato Seed Mix', 'seeds', 12.99, TRUE, 1),
(2, 'Organic Lettuce Seeds', 'seeds', 8.50, TRUE, 1),
(3, 'Sunflower Seeds - Giant', 'seeds', 6.99, TRUE, 1),
(4, 'Herb Garden Starter Kit', 'seeds', 24.99, TRUE, 1),
(5, 'Wildflower Meadow Blend', 'seeds', 15.99, TRUE, 1),
(6, 'Winter Squash Seeds', 'seeds', 9.99, TRUE, 1),
(7, 'Carrot Rainbow Mix', 'seeds', 7.99, TRUE, 1),
(8, 'Cucumber Seeds - Burpless', 'seeds', 5.99, TRUE, 1),

-- Tools (year-round)
(10, 'Ergonomic Hand Trowel', 'tools', 18.99, FALSE, 2),
(11, 'Bypass Pruning Shears', 'tools', 34.99, FALSE, 2),
(12, 'Garden Hoe - Long Handle', 'tools', 42.50, FALSE, 2),
(13, 'Watering Can - 2 Gallon', 'tools', 28.99, FALSE, 2),
(14, 'Garden Gloves - Medium', 'tools', 12.99, FALSE, 2),
(15, 'Soil Thermometer', 'tools', 16.99, FALSE, 2),
(16, 'Garden Fork - Heavy Duty', 'tools', 56.99, FALSE, 2),
(17, 'Hand Cultivator', 'tools', 22.99, FALSE, 2),

-- Fertilizers (spring/summer peak)
(20, 'Organic Compost Blend', 'fertilizers', 19.99, TRUE, 3),
(21, 'Tomato & Vegetable Fertilizer', 'fertilizers', 14.99, TRUE, 3),
(22, 'All-Purpose Plant Food', 'fertilizers', 11.99, FALSE, 3),
(23, 'Bone Meal - 5lb Bag', 'fertilizers', 16.99, FALSE, 3),
(24, 'Liquid Seaweed Fertilizer', 'fertilizers', 23.99, TRUE, 3),
(25, 'Rose & Flower Food', 'fertilizers', 18.99, TRUE, 3),

-- Planters (steady demand)
(30, 'Terracotta Pot - 8 inch', 'planters', 12.99, FALSE, 4),
(31, 'Ceramic Planter - Large', 'planters', 45.99, FALSE, 4),
(32, 'Hanging Basket - Wire', 'planters', 15.99, FALSE, 4),
(33, 'Window Box Planter', 'planters', 32.99, FALSE, 4),
(34, 'Decorative Pot Set - 3pc', 'planters', 38.99, FALSE, 4),
(35, 'Self-Watering Planter', 'planters', 54.99, FALSE, 4),

-- Pest Control (spring/summer peak)
(40, 'Organic Neem Oil Spray', 'pest_control', 19.99, TRUE, 5),
(41, 'Beneficial Nematodes', 'pest_control', 24.99, TRUE, 5),
(42, 'Copper Fungicide', 'pest_control', 16.99, TRUE, 5),
(43, 'Insecticidal Soap', 'pest_control', 12.99, TRUE, 5),
(44, 'Slug & Snail Bait - Organic', 'pest_control', 14.99, TRUE, 5);

-- Insert Customers (mix of registration dates over 2 years)
INSERT INTO customers (id, name, email, registration_date, customer_tier, city, state) VALUES
-- Gold tier customers (high value, early adopters)
(1, 'Sarah Johnson', 'sarah.johnson@email.com', '2023-03-15', 'gold', 'Portland', 'OR'),
(2, 'Michael Chen', 'mchen@gardenlover.com', '2023-04-02', 'gold', 'Seattle', 'WA'),
(3, 'Emily Rodriguez', 'emily.r.gardens@gmail.com', '2023-05-18', 'gold', 'San Francisco', 'CA'),
(4, 'David Wilson', 'dwilson@email.com', '2023-06-12', 'gold', 'Austin', 'TX'),
(5, 'Lisa Thompson', 'lisa.thompson@outlook.com', '2023-07-08', 'gold', 'Denver', 'CO'),

-- Silver tier customers (moderate spenders)
(6, 'James Anderson', 'j.anderson@email.com', '2023-08-22', 'silver', 'Phoenix', 'AZ'),
(7, 'Maria Garcia', 'maria.garcia@gmail.com', '2023-09-14', 'silver', 'Los Angeles', 'CA'),
(8, 'Robert Kim', 'robert.kim@email.com', '2023-10-03', 'silver', 'Chicago', 'IL'),
(9, 'Jennifer Davis', 'jdavis@email.com', '2023-11-17', 'silver', 'Miami', 'FL'),
(10, 'Christopher Lee', 'chris.lee@gmail.com', '2023-12-05', 'silver', 'Atlanta', 'GA'),
(11, 'Amanda White', 'amanda.white@email.com', '2024-01-20', 'silver', 'Boston', 'MA'),
(12, 'Daniel Martinez', 'dan.martinez@outlook.com', '2024-02-14', 'silver', 'Dallas', 'TX'),
(13, 'Nicole Brown', 'nicole.brown@gmail.com', '2024-03-08', 'silver', 'Nashville', 'TN'),
(14, 'Kevin Taylor', 'kevin.taylor@email.com', '2024-04-11', 'silver', 'Salt Lake City', 'UT'),
(15, 'Rachel Green', 'rachel.green@gmail.com', '2024-05-27', 'silver', 'Portland', 'ME'),

-- Bronze tier customers (newer or occasional buyers)
(16, 'Steven Clark', 'steven.clark@email.com', '2024-06-15', 'bronze', 'Richmond', 'VA'),
(17, 'Michelle Lewis', 'michelle.lewis@gmail.com', '2024-07-02', 'bronze', 'Kansas City', 'MO'),
(18, 'Brian Walker', 'brian.walker@email.com', '2024-07-18', 'bronze', 'Columbus', 'OH'),
(19, 'Jessica Hall', 'jessica.hall@outlook.com', '2024-08-05', 'bronze', 'Minneapolis', 'MN'),
(20, 'Thomas Allen', 'thomas.allen@gmail.com', '2024-08-22', 'bronze', 'Charlotte', 'NC'),
(21, 'Stephanie Young', 'stephanie.young@email.com', '2024-09-10', 'bronze', 'Tampa', 'FL'),
(22, 'Matthew King', 'matthew.king@gmail.com', '2024-09-28', 'bronze', 'Pittsburgh', 'PA'),
(23, 'Lauren Wright', 'lauren.wright@email.com', '2024-10-14', 'bronze', 'San Diego', 'CA'),
(24, 'Joshua Lopez', 'joshua.lopez@outlook.com', '2024-11-01', 'bronze', 'Las Vegas', 'NV'),
(25, 'Megan Hill', 'megan.hill@gmail.com', '2024-11-18', 'bronze', 'Milwaukee', 'WI');

-- Insert Orders (spanning March 2023 to November 2024, with seasonal patterns)
-- Spring 2023 orders (peak season)
INSERT INTO orders (id, customer_id, order_date, total_amount, status) VALUES
(1, 1, '2023-03-20', 89.96, 'completed'),
(2, 2, '2023-03-25', 156.47, 'completed'),
(3, 3, '2023-04-02', 203.94, 'completed'),
(4, 1, '2023-04-10', 67.98, 'completed'),
(5, 4, '2023-04-15', 134.95, 'completed'),
(6, 2, '2023-04-22', 98.97, 'completed'),
(7, 5, '2023-05-01', 176.93, 'completed'),
(8, 3, '2023-05-08', 87.96, 'completed'),
(9, 6, '2023-05-15', 123.94, 'completed'),
(10, 4, '2023-05-22', 156.98, 'completed'),

-- Summer 2023 orders
(11, 7, '2023-06-05', 89.97, 'completed'),
(12, 8, '2023-06-12', 145.96, 'completed'),
(13, 1, '2023-06-20', 78.98, 'completed'),
(14, 5, '2023-06-28', 234.95, 'completed'),
(15, 9, '2023-07-08', 167.94, 'completed'),
(16, 2, '2023-07-15', 123.97, 'completed'),
(17, 10, '2023-07-22', 198.96, 'completed'),
(18, 3, '2023-07-30', 156.95, 'completed'),
(19, 6, '2023-08-07', 89.98, 'completed'),
(20, 11, '2023-08-15', 234.93, 'completed'),

-- Fall 2023 orders (moderate activity)
(21, 4, '2023-09-05', 145.97, 'completed'),
(22, 7, '2023-09-12', 167.94, 'completed'),
(23, 12, '2023-09-20', 123.96, 'completed'),
(24, 8, '2023-09-28', 198.95, 'completed'),
(25, 1, '2023-10-08', 176.98, 'completed'),
(26, 13, '2023-10-15', 234.94, 'completed'),
(27, 5, '2023-10-22', 156.97, 'completed'),
(28, 9, '2023-10-30', 189.96, 'completed'),
(29, 2, '2023-11-07', 134.95, 'completed'),
(30, 14, '2023-11-15', 167.98, 'completed'),

-- Winter 2023-2024 orders (lower activity)
(31, 10, '2023-12-03', 98.97, 'completed'),
(32, 6, '2023-12-12', 156.94, 'completed'),
(33, 3, '2023-12-20', 123.98, 'completed'),
(34, 15, '2024-01-08', 189.95, 'completed'),
(35, 11, '2024-01-18', 167.96, 'completed'),
(36, 4, '2024-01-28', 145.97, 'completed'),
(37, 7, '2024-02-05', 234.94, 'completed'),
(38, 12, '2024-02-15', 176.98, 'completed'),
(39, 8, '2024-02-25', 198.95, 'completed'),

-- Spring 2024 orders (peak season again)
(40, 16, '2024-03-05', 156.97, 'completed'),
(41, 1, '2024-03-12', 289.94, 'completed'),
(42, 17, '2024-03-20', 123.98, 'completed'),
(43, 2, '2024-03-28', 267.95, 'completed'),
(44, 18, '2024-04-05', 189.96, 'completed'),
(45, 3, '2024-04-12', 234.97, 'completed'),
(46, 19, '2024-04-20', 167.94, 'completed'),
(47, 5, '2024-04-28', 298.95, 'completed'),
(48, 20, '2024-05-05', 145.98, 'completed'),
(49, 4, '2024-05-12', 223.96, 'completed'),
(50, 21, '2024-05-20', 178.97, 'completed'),

-- Summer 2024 orders
(51, 6, '2024-06-02', 267.94, 'completed'),
(52, 22, '2024-06-10', 134.98, 'completed'),
(53, 9, '2024-06-18', 198.95, 'completed'),
(54, 23, '2024-06-25', 156.97, 'completed'),
(55, 1, '2024-07-03', 289.96, 'completed'),
(56, 10, '2024-07-10', 223.94, 'completed'),
(57, 24, '2024-07-18', 167.98, 'completed'),
(58, 2, '2024-07-25', 334.95, 'completed'),
(59, 13, '2024-08-02', 245.97, 'completed'),
(60, 25, '2024-08-10', 189.94, 'completed'),

-- Fall 2024 orders (recent activity)
(61, 7, '2024-09-05', 198.96, 'completed'),
(62, 14, '2024-09-12', 267.94, 'completed'),
(63, 3, '2024-09-20', 245.98, 'completed'),
(64, 11, '2024-09-28', 178.95, 'completed'),
(65, 16, '2024-10-05', 234.97, 'completed'),
(66, 8, '2024-10-12', 289.94, 'completed'),
(67, 19, '2024-10-20', 156.98, 'completed'),
(68, 4, '2024-10-28', 267.95, 'completed'),
(69, 22, '2024-11-05', 189.97, 'completed'),
(70, 12, '2024-11-12', 223.94, 'completed');

-- Insert Order Items (detailed breakdown of each order)
-- Order 1 (Sarah Johnson - Spring starter order)
INSERT INTO order_items (id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 2, 12.99),  -- Heirloom Tomato Seeds x2
(2, 1, 4, 1, 24.99),  -- Herb Garden Kit
(3, 1, 10, 1, 18.99), -- Hand Trowel
(4, 1, 20, 1, 19.99), -- Organic Compost

-- Order 2 (Michael Chen - Comprehensive setup)
(5, 2, 2, 3, 8.50),   -- Lettuce Seeds x3
(6, 2, 11, 1, 34.99), -- Pruning Shears
(7, 2, 21, 2, 14.99), -- Vegetable Fertilizer x2
(8, 2, 30, 4, 12.99), -- Terracotta Pots x4
(9, 2, 14, 2, 12.99), -- Garden Gloves x2

-- Order 3 (Emily Rodriguez - Large spring order)
(10, 3, 5, 2, 15.99), -- Wildflower Blend x2
(11, 3, 12, 1, 42.50), -- Garden Hoe
(12, 3, 13, 1, 28.99), -- Watering Can
(13, 3, 24, 2, 23.99), -- Liquid Seaweed x2
(14, 3, 31, 2, 45.99), -- Large Ceramic Planters x2

-- Continue with more order items for realistic data...
-- Order 4
(15, 4, 7, 3, 7.99),  -- Carrot Seeds x3
(16, 4, 15, 1, 16.99), -- Soil Thermometer
(17, 4, 22, 2, 11.99), -- All-Purpose Food x2

-- Order 5
(18, 5, 3, 2, 6.99),  -- Sunflower Seeds x2
(19, 5, 16, 1, 56.99), -- Garden Fork
(20, 5, 25, 3, 18.99), -- Rose Food x3
(21, 5, 32, 2, 15.99), -- Hanging Baskets x2

-- Order 6
(22, 6, 8, 4, 5.99),  -- Cucumber Seeds x4
(23, 6, 17, 1, 22.99), -- Hand Cultivator
(24, 6, 23, 3, 16.99), -- Bone Meal x3

-- Order 7 (High-value order)
(25, 7, 1, 1, 12.99), -- Tomato Seeds
(26, 7, 11, 1, 34.99), -- Pruning Shears
(27, 7, 35, 2, 54.99), -- Self-Watering Planters x2
(28, 7, 40, 1, 19.99), -- Neem Oil
(29, 7, 34, 1, 38.99), -- Decorative Pot Set

-- Order 8
(30, 8, 6, 2, 9.99),  -- Winter Squash x2
(31, 8, 14, 1, 12.99), -- Garden Gloves
(32, 8, 20, 3, 19.99), -- Compost x3
(33, 8, 33, 1, 32.99), -- Window Box

-- Continue pattern for remaining orders
-- Summer orders focus more on tools, maintenance, pest control
-- Fall orders include planning for next year
-- Winter orders are smaller, focus on indoor/planning items

-- Orders 9-20 (Spring/Summer 2023)
(34, 9, 41, 1, 24.99), (35, 9, 42, 2, 16.99), (36, 9, 43, 3, 12.99), (37, 9, 10, 2, 18.99),
(38, 10, 1, 3, 12.99), (39, 10, 21, 4, 14.99), (40, 10, 30, 6, 12.99), (41, 10, 44, 1, 14.99),
(42, 11, 2, 2, 8.50), (43, 11, 13, 1, 28.99), (44, 11, 22, 3, 11.99), (45, 11, 32, 2, 15.99),
(46, 12, 4, 1, 24.99), (47, 12, 16, 1, 56.99), (48, 12, 25, 2, 18.99), (49, 12, 31, 1, 45.99),
(50, 13, 7, 4, 7.99), (51, 13, 15, 1, 16.99), (52, 13, 23, 2, 16.99),
(53, 14, 3, 2, 6.99), (54, 14, 11, 1, 34.99), (55, 14, 24, 4, 23.99), (56, 14, 35, 2, 54.99),
(57, 15, 5, 3, 15.99), (58, 15, 12, 1, 42.50), (59, 15, 20, 4, 19.99), (60, 15, 40, 1, 19.99),
(61, 16, 8, 2, 5.99), (62, 16, 17, 1, 22.99), (63, 16, 21, 3, 14.99), (64, 16, 33, 2, 32.99),
(65, 17, 1, 2, 12.99), (66, 17, 14, 3, 12.99), (67, 17, 22, 4, 11.99), (68, 17, 30, 8, 12.99),
(69, 18, 6, 1, 9.99), (70, 18, 13, 1, 28.99), (71, 18, 25, 5, 18.99), (72, 18, 34, 1, 38.99),
(73, 19, 2, 3, 8.50), (74, 19, 10, 2, 18.99), (75, 19, 41, 1, 24.99), (76, 19, 32, 2, 15.99),
(77, 20, 4, 2, 24.99), (78, 20, 16, 1, 56.99), (79, 20, 24, 6, 23.99), (80, 20, 31, 1, 45.99);

-- Adding final batch of order items for orders 21-70 (continuing seasonal patterns)
-- Spring: Heavy on seeds, fertilizers, new tools
-- Summer: Maintenance items, pest control, watering supplies  
-- Fall: Planning items, storage, some tools
-- Winter: Indoor supplies, gift items, planning for next year

-- Sample of remaining items (abbreviated due to length)
INSERT INTO order_items (id, order_id, product_id, quantity, unit_price) VALUES
-- Fall 2023 orders (21-30)
(81, 21, 11, 1, 34.99), (82, 21, 23, 3, 16.99), (83, 21, 30, 4, 12.99), (84, 21, 42, 2, 16.99),
(85, 22, 12, 1, 42.50), (86, 22, 20, 2, 19.99), (87, 22, 35, 2, 54.99),
(88, 23, 14, 4, 12.99), (89, 23, 22, 3, 11.99), (90, 23, 33, 2, 32.99),
(91, 24, 15, 2, 16.99), (92, 24, 21, 4, 14.99), (93, 24, 31, 3, 45.99),
(94, 25, 1, 3, 12.99), (95, 25, 17, 2, 22.99), (96, 25, 24, 4, 23.99), (97, 25, 34, 1, 38.99),

-- Winter 2023-2024 orders (31-39) - smaller orders
(98, 31, 13, 1, 28.99), (99, 31, 22, 2, 11.99), (100, 31, 30, 3, 12.99),
(101, 32, 14, 2, 12.99), (102, 32, 23, 4, 16.99), (103, 32, 32, 3, 15.99),
(104, 33, 10, 2, 18.99), (105, 33, 15, 1, 16.99), (106, 33, 31, 2, 45.99),

-- Spring 2024 orders (40-50) - Peak season returns
(107, 40, 2, 4, 8.50), (108, 40, 11, 1, 34.99), (109, 40, 20, 3, 19.99), (110, 40, 40, 2, 19.99),
(111, 41, 1, 5, 12.99), (112, 41, 4, 2, 24.99), (113, 41, 16, 1, 56.99), (114, 41, 25, 6, 18.99), (115, 41, 35, 2, 54.99),
(116, 42, 3, 3, 6.99), (117, 42, 12, 1, 42.50), (118, 42, 21, 4, 14.99),
(119, 43, 5, 4, 15.99), (120, 43, 13, 2, 28.99), (121, 43, 24, 8, 23.99), (122, 43, 31, 2, 45.99),

-- Continue this pattern through order 70...
-- For brevity, adding representative samples of the remaining orders
(123, 50, 7, 6, 7.99), (124, 50, 14, 3, 12.99), (125, 50, 22, 8, 11.99), (126, 50, 33, 4, 32.99),
(127, 55, 1, 4, 12.99), (128, 55, 11, 2, 34.99), (129, 55, 20, 6, 19.99), (130, 55, 35, 3, 54.99),
(131, 60, 8, 5, 5.99), (132, 60, 17, 2, 22.99), (133, 60, 24, 4, 23.99), (134, 60, 34, 2, 38.99),
(135, 65, 2, 3, 8.50), (136, 65, 16, 1, 56.99), (137, 65, 25, 6, 18.99), (138, 65, 30, 8, 12.99),
(139, 70, 4, 2, 24.99), (140, 70, 12, 1, 42.50), (141, 70, 21, 5, 14.99), (142, 70, 31, 3, 45.99);
