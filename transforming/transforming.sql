--drop tables if they exist
drop table SURVEY_RESPONSES;
drop table effective_care;
drop table READMISSIONS;

--Transform table to exclude NULL and ordinal variables
CREATE TABLE EFFECTIVE_CARE AS SELECT
	PROVIDER_ID, 
	CONDITION, 
	MEASURE_ID, 
	SCORE, 
	SAMPLE, 
	FOOTNOTE, 
	MEASURE_START_DATE, 
	MEASURE_END_DATE
FROM EFFECTIVE_CARE_RAW
	where score <> '' and 
		score not like 'High%' and 
		score not like 'Low%' and 
		score not like 'Med%' and 
		score not like 'Very%';

--Transform table to exclude NULL and rows where Number of Cases are too small
CREATE TABLE READMISSIONS AS SELECT
	PROVIDER_ID,
 	Measure_ID,
 	Compared_to_national,
 	Denominator,
 	Score,
 	Lower_estimate,
 	Higher_estimate,
 	Footnote,
 	Measure_start_date,
 	Measure_end_date
FROM READMISSIONS_RAW
	where compared_to_national <> '' and
		compared_to_national <> 'Number of Cases Too Small';

--Transform table to exclude null values
CREATE TABLE SURVEY_RESPONSES AS SELECT
	PROVIDER_ID,
 	HCAHPS_Base_Score,
 	HCAHPS_Consistency_Score 
 	FROM SURVEY_RESPONSES_RAW
 	where HCAHPS_Base_Score <> '' and
 		HCAHPS_Consistency_Score <> '';