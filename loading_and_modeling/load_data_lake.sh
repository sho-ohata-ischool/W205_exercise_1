#! /bin/bash

./start-hadoop.sh

su - w205

wget https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip

mkdir files

unzip Nq* -d files

cd files

for f in *.csv; do
	tail -n +2 "$f" > "{f}".tmp && mv "${f}".tmp "$f"
done

for f in *.csv; do
	sed -i 's/\Not Available//g' "$f"
done

mv "Hospital General Information.csv" hospitals.csv
mv "Timely and Effective Care - Hospital.csv" effective_care.csv
mv "Readmissions and Deaths - Hospital.csv" readmissions.csv
mv "Measure Dates.csv" Measures.csv
mv "hvbp_hcahps_05_28_2015.csv" survey_responses.csv

hdfs dfs -mkdir /user/w205/hospital_compare

hdfs dfs -put hospitals.csv /user/w205/hospital_compare
hdfs dfs -put effective_care.csv /user/w205/hospital_compare
hdfs dfs -put readmissions.csv /user/w205/hospital_compare
hdfs dfs -put Measures.csv /user/w205/hospital_compare
hdfs dfs -put survey_responses.csv /user/w205/hospital_compare