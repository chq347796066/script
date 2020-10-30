#!/bin/bash
a=1
idFile=$1"*"
delSql="delete from $1 where ID in ("
while read line
do
	if [ $((10$a%900)) -eq 0 ];then
	   delSql=${delSql%,*}")"\"","\""delete from $1 where ID in ("
	fi
    delSql=$delSql$line","
	let a++
done < /opt/software/datax/tempfile/$idFile
delSql=${delSql%,*}")"
echo $delSql
fileName=$1".json"
echo ${fileName}
python /opt/software/datax/bin/datax.py  -p "-DdelSql='${delSql}'"  /opt/software/datax/job/$fileName
