#!/usr/bin/env sh


ban_ip () {
	site_name="$1"
	WIKIPEDIA=$(ping ${site_name} -c1 | head -n1 | awk '{sub(/\(/,""); sub(/\)/,"") ; sub(/:/,"") ; print $3}')
	echo "0.0.0.0 ${WIKIPEDIA}" >> /etc/hosts
	echo "0.0.0.0 ${site_name}" >> /etc/hosts
}



for site in wikipedia.org wikimedia.org dyna.wikimedia.org en.wikipedia.org facebook.com;
do
#	echo $site
	ban_ip "${site}";
done
