SELECT 
    product_category,
    COUNT(DISTINCT CASE WHEN event = 'Browse' THEN user_id END) AS browse_users,
    COUNT(DISTINCT CASE WHEN event = 'Purchase' THEN user_id END) AS purchase_users,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(CASE WHEN event = 'Purchase' THEN revenue END), 2) AS avg_order_value
FROM clean_funnel
GROUP BY product_category
ORDER BY total_revenue DESC;
