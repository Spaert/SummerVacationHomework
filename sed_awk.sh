#!bin/bash

for i in `seq 1 91281`
do 
	echo "{\"index\":{_id\":\"$i\"}}"
	link="$(awk -v num="$i" '/@GAISRec:/{flag=1;next}/@T/{flag=0}flag && ++a==num' ettoday0.rec | awk '{print substr($1,4)}')"
	title="$(awk -v num="$i" '/@U:/{flag=1;next}/@B/{flag=0}flag && ++a==num' ettoday0.rec | awk '{print substr($1,4)}')"
	content="$(awk -v num="$i" '/@B:/{flag=1;next}/@GAISRec/{flag=0}flag && ++a==num' ettoday0.rec)"
	echo "{\"link\":\"$link\",\"title\":\"$title\",\"content\":\"$content\"}"
done
