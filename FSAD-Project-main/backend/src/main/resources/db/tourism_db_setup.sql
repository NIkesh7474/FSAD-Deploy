-- tourism_db initialization script
-- This script creates the database used by the backend.
-- Run with: mysql -uroot -pSasuke < tourism_db_setup.sql
-- To load all project data, use the full seed file:
--   mysql -uroot -pSasuke tourism_db < tourism_db_full_data.sql

CREATE DATABASE IF NOT EXISTS `tourism_db`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `tourism_db`;

-- If Spring Boot is configured with spring.jpa.hibernate.ddl-auto=update,
-- the tables and schema will be created/updated automatically at application startup.
-- The backend's DataInitializer class seeds initial data when the database is empty.
