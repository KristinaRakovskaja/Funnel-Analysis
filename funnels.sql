--Query for unique events					
					
WITH ranked_events AS (					
SELECT					
ROW_NUMBER() OVER (PARTITION BY user_pseudo_id, event_name ORDER BY event_timestamp) AS row_num,					
*					
FROM `tc-da-1.turing_data_analytics.raw_events`)					
					
					
SELECT					
*					
FROM ranked_events					
WHERE row_num = 1


-- Query that aggregates total number of events per top 3 countries		
		
WITH ranked_events AS (		
SELECT		
ROW_NUMBER() OVER (PARTITION BY user_pseudo_id, event_name ORDER BY event_timestamp) AS row_num,		
*		
FROM `tc-da-1.turing_data_analytics.raw_events`),		
		
unique_events AS (SELECT		
* 		
FROM ranked_events		
WHERE row_num = 1)		
		
SELECT		
country,		
COUNT(*) AS num_events		
FROM unique_events		
WHERE event_name IN ("view_item", "add_to_cart", "begin_checkout", "add_shipping_info", "add_payment_info", "purchase")		
GROUP BY country		
ORDER BY num_events DESC		
LIMIT 3			


-- Query that aggregates the number of identified events  per top 3 countries
	
WITH ranked_events AS (	
SELECT	
ROW_NUMBER() OVER (PARTITION BY user_pseudo_id, event_name ORDER BY event_timestamp) AS row_num,	
*	
FROM `tc-da-1.turing_data_analytics.raw_events`),	
	
unique_events AS (SELECT	
*	
FROM ranked_events	
WHERE row_num = 1),	
	
selected_events AS (	
SELECT	
ROW_NUMBER() OVER(ORDER BY COUNT(*)DESC) AS event_order,	
event_name,	
FROM `tc-da-1.turing_data_analytics.raw_events`	
WHERE event_name IN ("view_item", "add_to_cart", "begin_checkout", "add_shipping_info", "add_payment_info", "purchase")	
GROUP BY event_name	
)	
	
SELECT	
selected_events.event_order,	
selected_events.event_name,	
COUNTIF(unique_events.country = 'United States') AS US_events,	
COUNTIF(unique_events.country = 'India') AS India_events,	
COUNTIF(unique_events.country = 'Canada') AS Canada_events	
	
FROM selected_events	
JOIN unique_events	
ON selected_events.event_name = unique_events.event_name	
	
GROUP BY selected_events.event_order,	
selected_events.event_name	
ORDER BY event_order					