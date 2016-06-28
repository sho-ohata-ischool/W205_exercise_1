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

select measure_name, stddev(score_sd) as avg_score_sd 
	from measures m 
		inner join (
			select provider_id, measure_id, avg(cast(score as int)) as score_sd
				from effective_care 
					where score <> '' and 
						score not like 'High%' and 
						score not like 'Low%' and 
						score not like 'Med%' and 
						score not like 'Very%' 
					group by provider_id, measure_id) as hosp_measure_avg
		on m.measure_id = hosp_measure_avg.measure_id
	group by measure_name
	order by avg_score_sd desc
	limit 10;
				