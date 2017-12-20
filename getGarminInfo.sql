SELECT  garmines.id, 
ifnull( s.total_stock, 0 ) as stock,
ifnull( s.total_allocated, 0 ) as allocated_stock, 
ifnull( d.total_demand,0) as demand
FROM `garmines`
LEFT  JOIN ( 
SELECT garmines_id, ifnull( SUM(stocks.stock),0 ) as total_stock,
ifnull( SUM(stocks.allocated_stock ), 0 ) as total_allocated
 FROM stocks
GROUP BY stocks.garmines_id 
) AS s ON garmines.id = s.garmines_id 
LEFT  JOIN ( 
SELECT garmines_id, ifnull( SUM( garmines_pso.demand ) ,0) as total_demand
FROM garmines_pso
GROUP BY garmines_pso.garmines_id
) as d ON garmines.id = d.garmines_id 