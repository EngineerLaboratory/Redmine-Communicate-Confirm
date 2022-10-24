#!/bin/bash 

url_base="http://localhost:3000/projects/sample/issues.json"
offset=0
limit=100 # onetime obtain amount
jsonf="all_api.json"
loop_cnt=1

date_start=`date +%Y%m%d_%H%M%S_%3N`
for i in $(seq 1 $loop_cnt); do
  url="${url_base}?offset=${offset}&limit=${limit}"
  echo $url
  curl $url >> $jsonf
  offset=$offset+1
done
data_end=`date +%Y%m%d_%H%M%S_%3N`

echo $date_start
cat $jsonf
echo $data_end
