#!/bin/bash
cd ../covid-19-data
git pull
cp us-counties.csv ../covid-tracker/data/cases-data/
cd ../covid-tracker/data/cases-data
python csv2json.py us-counties.csv old-us-counties-cases.json
python gen_cases_data.py
mv us-county-cases.json ../../
python gen_csv_data.py
cd ../../
echo "Tail: "
tail -c 54 us-county-cases.json
echo "\n"
