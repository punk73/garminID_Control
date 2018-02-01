select model_no,sum(qty), end_date from t_file where model_no in 
("DNX516DABSEN", "DNX5160DABSEN", "DNX5160BTSEN") and 
create_time=(select max(create_time) from t_file)
group by month(end_date)
order by end_date ASC