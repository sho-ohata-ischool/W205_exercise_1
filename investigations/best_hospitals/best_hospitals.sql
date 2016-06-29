--select top 10 hospital name by average score
select h.hospital_name, avg(cast(ef.score as int)) as avg_score
	from effective_care ef 
		inner join hospitals h 
			on ef.provider_id = h.provider_id 
	group by ef.provider_id , h.hospital_name
	order by avg_score desc 
	limit 10;

--select top 10 hospital with highest aggregate score for the 5 most common measure
select h.hospital_name, sum(cast(score as int)) as avg_score
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
	group by h.hospital_name, h.provider_id
	order by avg_score desc 
	limit 10;

--select hospitals where readmission rates for various procedures on average are better than the national rate
select s1.hospital_name, hospital_better_count/hospital_total_count as hospital_ratio from (
	select h.hospital_name, count(*) as hospital_total_count
		from readmissions r
			inner join hospitals h
				on r.provider_id = h.provider_id
		group by h.hospital_name, h.provider_id) s1 inner join (
	select h.hospital_name, count(*) as hospital_better_count
		from readmissions r
			inner join hospitals h
				on r.provider_id = h.provider_id
			where compared_to_national = 'Better than the National Rate'
		group by h.hospital_name, h.provider_id) s2 
		on s1.hospital_name = s2.hospital_name
	where hospital_total_count > 10 
	and hospital_better_count > 10
	order by hospital_ratio desc
	limit 10;