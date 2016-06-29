--Calculate standard deviation of the procedure across hospitals
select measure_name, stddev(cast(score as int)) as score_sd
	from effective_care ef 
		inner join measures m 
		on ef.measure_id = m.measure_id
	group by measure_name
	order by score_sd desc 
	limit 10;

--Calculate standard deviation of the survey_score for measure
select measure_name, avg(cast(hcahps_base_score as int) + cast(hcahps_consistency_score as int)) as surv_score
	from survey_responses s 
		inner join measures m
			on s.measure_id = m.measure_id
	group by measure_name
	order by surv_score desc
	limit 10;