Create Database AI_Powered_Monitoring_System 

use AI_Powered_Monitoring_System

CREATE TABLE Servers ( 
server_id INT PRIMARY KEY, 
server_name VARCHAR(50), 
region VARCHAR(50) 
);

SELECT * FROM Servers

INSERT INTO Servers VALUES 
(1, 'web-server-01', 'us-east'), 
(2, 'db-server-01', 'us-east'), 
(3, 'api-server-01', 'eu-west'), 
(4, 'cache-server-01', 'us-west');

CREATE TABLE Alerts ( 
alert_id INT PRIMARY KEY, 
server_id INT, 
alert_type VARCHAR(50),
severity VARCHAR(20)
); 

SELECT * FROM Alerts

INSERT INTO Alerts VALUES 
(101, 1, 'CPU Spike', 'High'), 
(102, 2, 'Disk Failure', 'Critical'), 
(103, 2, 'Memory Leak', 'Medium'), 
(104, 5, 'Network Latency', 'Low'); -- Invalid server_id (edge case)

CREATE TABLE AI_Models ( 
model_id INT PRIMARY KEY, 
model_name VARCHAR(50), 
use_case VARCHAR(50) 
); 

SELECT * FROM AI_Models

INSERT INTO AI_Models VALUES 
(201, 'AnomalyDetector-v2', 'Alert Prediction'), 
(202, 'ResourceForecaster', 'Capacity Planning'), 
(203, 'LogParser-NLP', 'Log Analysis'); 

CREATE TABLE ModelDeployments ( 
deployment_id INT PRIMARY KEY, 
server_id INT, 
model_id INT, 
deployed_on DATE 
); 

SELECT * FROM ModelDeployments

INSERT INTO ModelDeployments VALUES 
(301, 1, 201, '2025-06-01'), 
(302, 2, 201, '2025-06-03'), 
(303, 2, 202, '2025-06-10'), 
(304, 3, 203, '2025-06-12'); 


--Task 1: INNER JOIN  
--1- List all alerts with the corresponding server name?

SELECT a.alert_id, s.server_name, a.alert_type, a.severity
FROM Alerts a
INNER JOIN Servers s ON a.server_id = s.server_id;

-- Task 2: LEFT JOIN 
-- List all servers and any alerts they might have received?

SELECT s.server_id, s.server_name, s.region, a.alert_id, a.alert_type, a.severity
FROM Servers s
LEFT JOIN Alerts a ON s.server_id = a.server_id;

-- Task 3: RIGHT JOIN 
-- Show all alerts and the server name that triggered them, including alerts without a matching server?

SELECT a.alert_id, a.alert_type, a.severity, s.server_id, s.server_name, s.region
FROM Alerts a
RIGHT JOIN Servers s ON a.server_id = s.server_id;

-- Task 4: FULL OUTER JOIN 
-- List all servers and alerts, including unmatched ones on both sides?

SELECT s.server_id, s.server_name, s.region, a.alert_id, a.alert_type, a.severity
FROM Servers s FULL OUTER JOIN Alerts a
ON s.server_id = a.server_id

-- Task 5: CROSS JOIN 
-- Pair every AI model with every server (e.g., simulation of possible deployments)?

SELECT s.server_id, s.server_name, m.model_id, m.model_name, m.use_case
FROM Servers s
CROSS JOIN AI_Models m;