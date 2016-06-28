select h.hospital_name, avg(cast(ef.score as int)) as avg_score
	from effective_care ef 
		inner join hospitals h 
		on ef.provider_id = h.provider_id
	where score <> '' and 
	score not like 'High%' and 
	score not like 'Low%' and 
	score not like 'Med%' and 
	score not like 'Very%' 
	group by ef.provider_id , h.hospital_name
	order by avg_score desc 
	limit 10;

select h.hospital_name, sum(cast(score as int)) as avg_score
	from effective_care ef 
		inner join hospitals h 
			on ef.provider_id = h.provider_id
		inner join (
			select measure_id, count(measure_id) as count_m 
				from effective_care 
					where score <> '' and 
					score not like 'High%' and 
					score not like 'Low%' and 
					score not like 'Med%' and 
					score not like 'Very%' 
				group by measure_id
				order by count_m desc
				limit 5) top_measure
			on ef.measure_id = top_measure.measure_id
		where score <> '' and 
			score not like 'High%' and 
			score not like 'Low%' and 
			score not like 'Med%' and 
			score not like 'Very%' 
	group by h.hospital_name
	order by avg_score desc 
	limit 10;