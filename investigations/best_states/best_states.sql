select h.state, avg(cast(score as int)) as avg_score
	from effective_care ef 
		inner join hospitals h
			on ef.provider_id = h.provider_id
	where score <> '' and 
		score not like 'High%' and 
		score not like 'Low%' and 
		score not like 'Med%' and 
		score not like 'Very%' 
	group by h.state
	order by avg_score desc 
limit 10;

select s1.state, state_better_count/state_total_count as state_ratio from (
	select h.state, count(*) as state_total_count
		from readmissions r
			inner join hospitals h
				on r.provider_id = h.provider_id
			where compared_to_national <> '' and
				compared_to_national not like 'Number of Cases%'
		group by h.state) s1 inner join (
	select h.state, count(*) as state_better_count
		from readmissions r
			inner join hospitals h
				on r.provider_id = h.provider_id
			where compared_to_national = 'Better than the National Rate'
		group by h.state) s2 
		on s1.state = s2.state
	where state_total_count > 0 
	and state_better_count > 0
	order by state_ratio desc
	limit 10;