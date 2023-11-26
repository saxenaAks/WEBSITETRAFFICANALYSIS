-- Create a table to store website traffic data
CREATE TABLE web_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    timestamp DATETIME,
    page_url VARCHAR(255),
    visitor_ip VARCHAR(15)
);

-- Insert sample data into the web_logs table
-- adding some data for my code 
INSERT INTO web_logs (timestamp, page_url, visitor_ip) VALUES
('2023-11-01 12:30:00', '/homepage', '192.168.1.1'),
('2023-11-01 12:35:00', '/products', '192.168.1.2'),
('2023-11-01 12:40:00', '/homepage', '192.168.1.3');
-- Add more sample records as needed

-- Query to get total page views
SELECT COUNT(*) AS total_page_views FROM web_logs;

-- Query to get unique visitors
SELECT COUNT(DISTINCT visitor_ip) AS unique_visitors FROM web_logs;

-- Query to get most visited pages
SELECT page_url, COUNT(*) AS page_views
FROM web_logs
GROUP BY page_url
ORDER BY page_views DESC
LIMIT 5;

-- Query to analyze traffic over time (e.g., hourly)
SELECT HOUR(timestamp) AS hour, COUNT(*) AS page_views
FROM web_logs
GROUP BY hour
ORDER BY hour;
