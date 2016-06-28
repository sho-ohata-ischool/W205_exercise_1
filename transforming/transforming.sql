CREATE TABLE EFFECTIVE_CARE AS SELECT
	PROVIDER_ID, 
	CONDITION, 
	MEASURE_ID, 
	SCORE, 
	SAMPLE, 
	FOOTNOTE, 
	MEASURE_START_DATE, 
	MEASURE_END_DATE
	FROM EFFECTIVE_CARE_RAW;

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
	FROM READMISSIONS_RAW;

CREATE TABLE SURVEY_RESPONSE AS SELECT
	PROVIDER_ID,
	Comm_Nurses_Achieve_Pts,
 	Comm_Nurses_Improv_Pts,
 	Comm_Nurses_Dim_Score,
 	Comm_Doctor_Achieve_Pts,
 	Comm_Doctor_Improv_Pts,
 	Comm_Doctor_Dim_Score,
 	Respons_Staff_Achieve_Pts,
 	Respons_Staff_Improv_Pts,
 	Respons_Staff_Dim_Score,
 	Pain_Mgmt_Achieve_Pts,
 	Pain_Mgmt_Improv_Pts,
 	Pain_Mgmt_Dim_Score,
 	Comm_abt_Meds_Achieve_Pts,
 	Comm_abt_Meds_Improv_Pts,
 	Comm_abt_Meds_Dim_Score,
 	Clean_Quiet_Hosp_Achieve_Pts,
 	Clean_Quiet_Hosp_Improv_Pts,
 	Clean_Quiet_Hosp_Dim_Score,
 	Discharge_Info_Achieve_Pts,
 	Discharge_Info_Improv_Pts,
 	Discharge_Info_Dim_Score,
 	Overall_Rate_Hosp_Achieve_Pts,	
 	Overall_Rate_Hosp_Improv_Pts,
 	Overall_Rate_Hosp_Dim_Score,
 	HCAHPS_Base_Score,
 	HCAHPS_Consistency_Score 
 	FROM SURVEY_RESPONSES_RAW;