--select top 10 states where the average score across all procedures are highest 
select h.state, avg(cast(score as int)) as avg_score
	from effective_care ef 
		inner join hospitals h
			on ef.provider_id = h.provider_id 
	group by h.state
	order by avg_score desc 
limit 10;

--select top 10 states with highest aggregate score for the 5 most common measure
select h.state, sum(cast(score as int)) as avg_score
	from effective_care ef 
		inner join hospitals h 
			on ef.provider_id = h.provider_id
		inner join (
			select measure_id, count(measure_id) as count_m 
				from effective_care 
			group by measure_id
			order by count_m desc
			limit 5) top_measure
			on ef.measure_id = top_measure.measure_id
	group by h.state
	order by avg_score desc 
	limit 10;

--select states where readmission rates for various procedures on average are better than the national rate
select s1.state, state_better_count/state_total_count as state_ratio from (
	select h.state, count(*) as state_total_count
		from readmissions r
			inner join hospitals h
				on r.provider_id = h.provider_id
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