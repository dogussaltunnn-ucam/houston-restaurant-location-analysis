SELECT *
FROM restaurants
LIMIT 10;
SELECT COUNT(*) AS total_rows
FROM restaurants;
PRAGMA table_info(restaurants);
SELECT *
FROM restaurants
LIMIT 10;
PRAGMA table_info(restaurants);
SELECT name
FROM pragma_table_info('restaurants');
SELECT
    city,
    COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY city
ORDER BY restaurant_count DESC
LIMIT 10;
SELECT
    description,
    COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY description
ORDER BY restaurant_count DESC
LIMIT 10;
SELECT name
FROM pragma_table_info('restaurants')
WHERE lower(name) LIKE '%long%'
   OR lower(name) LIKE '%lat%'
   OR lower(name) LIKE '%rate%'
   OR lower(name) LIKE '%review%'
   OR lower(name) LIKE '%star%'
   OR lower(name) LIKE '%price%'
ORDER BY name;
SELECT *
FROM restaurants
LIMIT 1;
SELECT
    city,
    latitude,
    longitude
FROM restaurants
LIMIT 10;
SELECT
    priceRange,
    COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY priceRange
ORDER BY restaurant_count DESC;
SELECT
    market,
    city,
    name,
    description,
    priceRange,
    latitude,
    longitude
FROM restaurants
WHERE latitude IS NOT NULL
  AND longitude IS NOT NULL;
SELECT
    CASE
        WHEN instr(description, '•') > 0 THEN trim(substr(description, instr(description, '•') + 1))
        ELSE trim(description)
    END AS cuisine_tags,
    COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY cuisine_tags
ORDER BY restaurant_count DESC
LIMIT 15;
SELECT
    market,
    city,
    name,
    description,
    CASE
        WHEN TRIM(priceRange) = '' THEN 'Unknown'
        ELSE priceRange
    END AS price_range,
    latitude,
    longitude
FROM restaurants
WHERE latitude IS NOT NULL
  AND longitude IS NOT NULL;
SELECT
    city,
    COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY city
ORDER BY restaurant_count DESC
LIMIT 15;
SELECT
    CASE
        WHEN TRIM(priceRange) = '' THEN 'Unknown'
        ELSE priceRange
    END AS price_range,
    COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY price_range
ORDER BY restaurant_count DESC;
SELECT
    CASE
        WHEN instr(description, '•') > 0 THEN trim(substr(description, instr(description, '•') + 1))
        ELSE trim(description)
    END AS cuisine_tags,
    COUNT(*) AS restaurant_count
FROM restaurants
WHERE trim(description) NOT IN ('$', '$$', '$$$', '$$$$')
GROUP BY cuisine_tags
ORDER BY restaurant_count DESC
LIMIT 15;