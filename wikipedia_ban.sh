#!/usr/bin/env sh

BLOCKED_SITES=(wikipedia.org wikimedia.org dyna.wikimedia.org en.wikipedia.org facebook.com en.m.wikipedia.org)

HOSTS_FILE=/etc/hosts

ban_ip () {
	site_name="$1"
	WIKIPEDIA=$(ping ${site_name} -c1 | head -n1 | awk '{sub(/\(/,""); sub(/\)/,"") ; sub(/:/,"") ; print $3}')

	if [[ $WIKIPEDIA != "127.0.0.1" ]]; then
		# Only add a blocked ip if it doesnt already exist
		grep -q "0.0.0.0 ${WIKIPEDIA}" ${HOSTS_FILE} || 
		echo "0.0.0.0 ${WIKIPEDIA}" >> ${HOSTS_FILE}
	fi

	grep -q "0.0.0.0 ${site_name}" ${HOSTS_FILE} ||
	echo "0.0.0.0 ${site_name}" >> ${HOSTS_FILE}
}



for site in ${BLOCKED_SITES[@]};
do
	#echo $site
	ban_ip "${site}";
done
