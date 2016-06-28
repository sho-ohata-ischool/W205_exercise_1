select h.hospital_name, cast(hcahps_base_score as int) + cast(hcahps_consistency_score as int) as surv_score,
	avg_score, score_sd
	from survey_responses s 
		inner join hospitals h 
		on s.provider_id=h.provider_id
		inner join (
			select provider_id, avg(cast(score as int)) as avg_score, stddev(cast(score as int)) as score_sd 
			from effective_care 
				where score <> '' and 
					score not like 'High%' and 
					score not like 'Low%' and 
					score not like 'Med%' and 
					score not like 'Very%'
				group by  provider_id) ef 
			on s.provider_id = ef.provider_id
		and hcahps_base_score <> ''
	order by avg_score desc 