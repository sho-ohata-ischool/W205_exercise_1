The initial setup script "load_data_lake.sh" assumes that the user has an AWS instance up and running with Hadoop installed. 

The user should start hadoop as well as postgres and change to user w205 and download the medicare data into their /data folder. Once the data is loaded into the /data folder the script will do the rest in moving the necessary files into hdfs.

Link to medicare data:
https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip
