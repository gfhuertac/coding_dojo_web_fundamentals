USE lead_gen_business;

# 1. What query would you run to get the total revenue for March of 2012?

SELECT SUM(amount)
FROM billing
WHERE MONTH(charged_datetime) = 03 AND YEAR(charged_datetime) = 2012;

# 2. What query would you run to get total revenue collected from the client with an id of 2?

SELECT SUM(b.amount)
FROM billing AS b JOIN clients AS c ON b.client_id = c.client_id
WHERE c.client_id = 2;

# 3. What query would you run to get all the sites that client=10 owns?

SELECT s.domain_name
FROM sites AS s JOIN clients AS c ON c.client_id = s.client_id
WHERE c.client_id = 10;

# 4. What query would you run to get total # of sites created per month per year for the client with an id of 1? What about for client=20?

SELECT c.client_id, MONTH(s.created_datetime) as month, YEAR(s.created_datetime) AS year, COUNT(s.site_id) AS total
FROM sites AS s JOIN clients AS c ON c.client_id = s.client_id
WHERE c.client_id IN (1, 20)
GROUP BY c.client_id, month, year
ORDER BY c.client_id, year, month;

# 5. What query would you run to get the total # of leads generated for each of the sites between January 1, 2011 to February 15, 2011?

SELECT s.domain_name, COALESCE(COUNT(l.leads_id), 0) AS total
FROM sites AS s LEFT JOIN leads AS l ON s.site_id = l.site_id
WHERE l.registered_datetime BETWEEN '2011-01-01' AND '2011-02-15'
GROUP BY s.domain_name;

# 6. What query would you run to get a list of client names and the total # of leads we've generated for each of our clients between January 1, 2011 to December 31, 2011?

SELECT c.first_name, c.last_name, COUNT(l.leads_id) AS total
FROM clients AS c JOIN sites AS s ON c.client_id = s.client_id
    JOIN leads AS l ON l.site_id = s.site_id
WHERE l.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY c.first_name, c.last_name
ORDER BY total DESC;

# 7. What query would you run to get a list of client names and the total # of leads we've generated for each client each month between months 1 - 6 of Year 2011?

SELECT c.first_name, c.last_name, MONTHNAME(l.registered_datetime) AS month, COUNT(l.leads_id) AS total
FROM clients AS c JOIN sites AS s ON c.client_id = s.client_id
    JOIN leads AS l ON l.site_id = s.site_id
WHERE l.registered_datetime BETWEEN '2011-01-01' AND '2011-06-31'
GROUP BY c.first_name, c.last_name, month
ORDER BY c.last_name, month;

# 8. What query would you run to get a list of client names and the total # of leads we've generated for each of our clients' sites between January 1, 2011 to December 31, 2011? Order this query by client id.  
# Come up with a second query that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.

SELECT c.first_name, c.last_name, s.domain_name, COUNT(l.leads_id) AS total
FROM clients AS c JOIN sites AS s ON c.client_id = s.client_id
    JOIN leads AS l ON l.site_id = s.site_id
WHERE l.registered_datetime BETWEEN '2011-01-01' AND '2011-12-31'
GROUP BY c.first_name, c.last_name, s.domain_name
ORDER BY c.client_id, s.domain_name;

SELECT c.first_name, c.last_name, s.domain_name, COUNT(l.leads_id) AS total
FROM clients AS c JOIN sites AS s ON c.client_id = s.client_id
    JOIN leads AS l ON l.site_id = s.site_id
GROUP BY c.first_name, c.last_name, s.domain_name
ORDER BY c.client_id ASC;

# 9. Write a single query that retrieves total revenue collected from each client for each month of the year. Order it by client id.

SELECT c.first_name, c.last_name, YEAR(b.charged_datetime) AS year, MONTHNAME(b.charged_datetime) AS month, SUM(b.amount) AS total
FROM billing AS b JOIN clients AS c ON b.client_id = c.client_id
GROUP BY c.first_name, c.last_name, year, month
ORDER BY c.client_id, year, MONTH(b.charged_datetime)
;

# 10. Write a single query that retrieves all the sites that each client owns. 
# Group the results so that each row shows a new client. 
# It will become clearer when you add a new field called 'sites' that has all the sites that the client owns. (HINT: use GROUP_CONCAT)

SELECT c.first_name, c.last_name, GROUP_CONCAT(s.domain_name SEPARATOR ' / ')
FROM clients AS c JOIN sites AS s on c.client_id = s.client_id
GROUP BY c.first_name, c.last_name
ORDER BY c.last_name;