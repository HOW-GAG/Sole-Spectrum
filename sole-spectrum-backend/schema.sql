-- ============================================================
-- Sole Spectrum Database Schema
-- Run this against your Aiven MySQL database
-- ============================================================

-- 1. USERS TABLE
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  phone VARCHAR(20) DEFAULT '',
  role ENUM('customer', 'admin') DEFAULT 'customer',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. PRODUCTS TABLE
CREATE TABLE IF NOT EXISTS products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  brand VARCHAR(100) DEFAULT '',
  price DECIMAL(10, 2) NOT NULL,
  category VARCHAR(100) DEFAULT '',
  stock INT DEFAULT 0,
  image VARCHAR(50) DEFAULT '👟',
  color VARCHAR(20) DEFAULT '#000000',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. ORDERS TABLE
CREATE TABLE IF NOT EXISTS orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  shipping_address TEXT,
  status ENUM('pending', 'processing', 'shipped', 'delivered') DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 4. ORDER ITEMS TABLE
CREATE TABLE IF NOT EXISTS order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- ============================================================
-- DEMO DATA — Admin user + Sample products
-- ============================================================

-- Admin user (password: Admin123)
INSERT INTO users (name, email, password, phone, role) VALUES
('Admin', 'admin@solespectrum.com', '$2a$12$LJ3m4ys3GZxkFMwON1Yxx.0v4DK.huJEZVBfmJGKvTgvy1F.YMIqe', '+63 912 000 0001', 'admin');

-- Demo customer (password: Customer1)
INSERT INTO users (name, email, password, phone, role) VALUES
('Juan dela Cruz', 'customer@email.com', '$2a$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+63 912 000 0002', 'customer');

-- Sample products (Philippine Peso pricing)
INSERT INTO products (name, brand, price, category, stock, image, color) VALUES
('Air Max 90', 'Nike', 7495.00, 'Lifestyle', 25, '👟', '#FF5733'),
('Ultraboost 22', 'Adidas', 9990.00, 'Running', 18, '🏃', '#3498DB'),
('Classic Leather', 'Reebok', 4495.00, 'Lifestyle', 30, '👞', '#8B4513'),
('Suede Classic', 'Puma', 4995.00, 'Lifestyle', 22, '👟', '#2ECC71'),
('Chuck Taylor All Star', 'Converse', 3495.00, 'Casual', 40, '👟', '#E74C3C'),
('Old Skool', 'Vans', 3995.00, 'Casual', 35, '🛹', '#1ABC9C'),
('Gel-Kayano 29', 'Asics', 8495.00, 'Running', 12, '🏃', '#9B59B6'),
('574 Core', 'New Balance', 5495.00, 'Lifestyle', 20, '👟', '#F39C12'),
('Zoom Pegasus 40', 'Nike', 6995.00, 'Running', 15, '🏃', '#E67E22'),
('Forum Low', 'Adidas', 5995.00, 'Casual', 28, '👟', '#1F77B4');
