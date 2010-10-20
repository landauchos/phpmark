#!/bin/bash

# Change the following settings if needed
BENCH_INIT="/usr/sbin/ab -n 5";
BENCH_EXEC="/usr/sbin/ab -t 30 -c 10"
HTTP_START='sudo /etc/init.d/apache2 start'
HTTP_STOP='sudo /etc/init.d/apache2 stop'

CONFIG_FILE='README'
TIME=`date "+%Y%m%d-%H%M%S"`
OUTPUT_FILE="benchmark-$TIME.txt"

###########################################################

if [ $# -ne 1 ]; then
	echo Usage: $0 base-uri
	echo where \"base-uri\" is the URL to the current directory without ending slash
	exit 127
fi

BASE_URI=$1

while read LINE
do
    # Find lines with "framework name: /uri", ignoring lines startings with "#"
    if echo $LINE |  grep -v "^#" | grep -q ": \+/"
    then
        TEST=${LINE%:*}
        URI=`echo ${LINE#*:} | sed 's/^ *//' | sed 's/ *$//'`
        TEST_URL="$BASE_URI$URI"
        echo "Testing $TEST_URL"

        # Restart apache, warm up the target url, hit it and sleep.
        $HTTP_STOP
        $HTTP_START
        sleep 2
        $BENCH_INIT $TEST_URL > /dev/null 2>&1
        echo "~~~ Testing $TEST : $TEST_URL" >> $OUTPUT_FILE
        $BENCH_EXEC $TEST_URL >> $OUTPUT_FILE
        sleep 3
    fi
done < $CONFIG_FILE

cat $OUTPUT_FILE | grep -e Path -e Request
