
mkdir /root/import
cd import/

wget https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip

unzip Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s\?content_type\=application%2Fzip\;\ charset\=binary

cd ..

hdfs dfs -mkdir /user/w205/maxshen/hive
hdfs dfs -mkdir /user/w205/maxshen/hospital_compare
hdfs dfs -mkdir /user/w205/maxshen/hospital_compare/hospital
hdfs dfs -mkdir /user/w205/maxshen/hospital_compare/care
hdfs dfs -mkdir /user/w205/maxshen/hospital_compare/readmission
hdfs dfs -mkdir /user/w205/maxshen/hospital_compare/survey


tail -n +2 /root/import/'Hospital General Information.csv'>/root/import/hospitals.csv
tail -n +2 /root/import/'Timely and Effective Care - Hospital.csv'>/root/import/effective_care.csv
tail -n +2 /root/import/'Readmissions and Deaths - Hospital.csv'>/root/import/readmissions.csv
tail -n +2 /root/import/'hvbp_hcahps_05_28_2015.csv'>/root/import/surveys_responses.csv

hdfs dfs -put /root/import/hospitals.csv /user/w205/maxshen/hive
hdfs dfs -put /root/import/effective_care.csv /user/w205/maxshen/hive
hdfs dfs -put /root/import/readmissions.csv /user/w205/maxshen/hive
hdfs dfs -put /root/import/surveys_responses.csv /user/w205/maxshen/hive


