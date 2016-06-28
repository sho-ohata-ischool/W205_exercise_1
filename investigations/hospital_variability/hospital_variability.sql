select measure_name, stddev(cast(score as int)) as score_sd
	from effective_care ef 
		inner join measures m 
		on ef.measure_id = m.measure_id
	where score <> '' and 
		score not like 'High%' and 
		score not like 'Low%' and 
		score not like 'Med%' and 
		score not like 'Very%' 
	group by measure_name
	order by score_sd desc 
	limit 10;				