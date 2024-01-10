/* ----------------
   ---- EVENTS ----
   ---------------- */
   
/* Create a one off event called 'one_time_event'
- Log the event in a table called 'monitoring events' in
the practice db using the below code to create the table
- The event will log timestamp values into the Last_Update column
- Schedule the event for 1 minute after the event has been created
*/

USE practice1;

-- Turn ON Event Scheduler 
SET GLOBAL event_scheduler = ON;

-- Create the table to store the event
CREATE TABLE monitoring_events
(ID INT NOT NULL AUTO_INCREMENT, 
Last_Update TIMESTAMP,
PRIMARY KEY (ID));

/*
Use the base syntax below to create an event:

DELIMITER //
CREATE EVENT <event_name>
   ON SCHEDULE <time_stamp>	 -- example: ON SCHEDULE AT NOW()
										+ INTERVAL 7 SECOND
DO BEGIN 
	<event_body>;
END //
DELIMITER ;
*/

/* Check the monitoring_events table in 1 minute to check
the event has succesfully completed */

-- ON SCHEDULE AT NOW() + INTERVAL 1 MINUTE

DELIMITER //
CREATE EVENT one_time_event
	ON SCHEDULE AT NOW() + INTERVAL 1 MINUTE
DO BEGIN
	INSERT INTO monitoring_events(Last_Update) VALUES (NOW());
    END //
DELIMITER ;

SELECT * FROM monitoring_events;

/* Write a recurring event called 'recurring_time_event'
- Log the event in a table called 'monitoring_events_version2
events' in the practice db using the below code to create the
table
- The event will log timestamp values into the Last_Update column
- Schedule the event to run every 2 seconds after the event has
been created
- ON SCHEDULE EVERY 2 MINUTE
*/

CREATE TABLE monitoring_events_version2
(ID INT NOT NULL AUTO_INCREMENT, 
Last_Update TIMESTAMP,
PRIMARY KEY (ID));

/* Check the monitoring_events_version2 table to check
the event is succesfully running */
DELIMITER //
CREATE EVENT recurring_time_event
	ON SCHEDULE EVERY 2 SECOND
DO BEGIN
	INSERT INTO monitoring_events_version2(Last_Update) VALUES (NOW());
    END //
DELIMITER ;

SELECT * FROM monitoring_events_version2;

/* Drop the monitoring_events_version2 table and the
recurring_time_event, otherwise this event will keep on running! */
DROP TABLE monitoring_events_version2;
DROP EVENT recurring_time_event;
