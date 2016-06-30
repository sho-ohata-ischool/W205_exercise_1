--Calculate standard deviation of the procedure across hospitals
select measure_name, stddev(cast(score as int)) as score_sd
	from effective_care ef 
		inner join measures m 
		on ef.measure_id = m.measure_id
	group by measure_name
	order by score_sd desc 
	limit 10;

--Calculate standard deviation of the readmission for measure
select measure_name, stddev(cast(score as int)) as score_sd
	from readmissions r 
		inner join measures m
			on r.measure_id = m.measure_id
	group by measure_name
	order by score_sd desc
	limit 10;