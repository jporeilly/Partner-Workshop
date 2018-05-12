SELECT
s.sale_id
, s.date AS sale_date
, s.customer_id
, s.sales_channel_id
, sc.sales_channel
, s.amount AS sales
, l.lens_id
, l.name AS lens_name
, l.year AS lens_year
, l.focal_length_min
, l.focal_length_max
, l.aperture_max
, l.aperture_min
, l.focusing_distance_min
, l.filter_size
, lc.lens_category
, c.name AS customer_name
, c.address
, c.city
FROM
sls_raw.sales s
LEFT JOIN 
sls_raw.lens l
ON
s.lens_id = l.lens_id
LEFT JOIN
sls_raw.lens_category lc
ON
l.lens_category_id = lc.lens_category_id
LEFT JOIN
sls_raw.sales_channel sc
ON
s.sales_channel_id = sc.sales_channel_id
LEFT JOIN
sls_raw.customer c
ON
s.customer_id = c.customer_id
;
