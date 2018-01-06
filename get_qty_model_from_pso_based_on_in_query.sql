select model_no, cast( sum( qty ) as unsigned ) as Qty from db_pso.t_file where 
db_pso.t_file.model_no in (
	(select Model_Number from garmin_inventory.garmines_pso where garmines_id = '16AM_EU-Low_010-D4878-30')
)
and create_time=(select max(create_time) from db_pso.t_file) 
group by model_no
