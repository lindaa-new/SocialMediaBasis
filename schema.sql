CREATE DATABASE IF NOT EXISTS lindaa_internship_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE lindaa_internship_db;

-- Tabel Admin
CREATE TABLE IF NOT EXISTS admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Default Admin (Username: admin, Password: password123 -> Di-hash dengan password_hash PHP)
-- Password default: lindaa2026
INSERT INTO admins (username, password) VALUES 
('admin', '$2y$10$8W3aT1zN8c1Q0KxW3qZ02u6jXg5mP8s9XwF0Z9Q2xV3b1N2m4Kx6a')
ON DUPLICATE KEY UPDATE username=username;

-- Tabel Platforms (Social Media)
CREATE TABLE IF NOT EXISTS platforms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Default Platforms
INSERT INTO platforms (name) VALUES 
('Basisnetwork'),
('medamainvestasi'),
('teman_bangun'),
('temanlamaindonesia'),
('marry_madinah'),
('banuabagus'),
('pagasimotor')
ON DUPLICATE KEY UPDATE name=name;

-- Tabel Content / Ide Konten
CREATE TABLE IF NOT EXISTS contents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    platform_name VARCHAR(150) NOT NULL,
    post_date DATE NOT NULL,
    idea TEXT NOT NULL,
    image_url LONGTEXT,
    acc_status ENUM('pending', 'acc', 'rejected') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);