#!/bin/sh
#
# Example script used to execute an alert action.
#

MAILTO="root@localhost"

if [ $# != 3 ] ; then
	echo "$0: Wrong number of arguments."
	exit 1
fi

ALERT_TIMEINTVL=$1
ALERT_THRESHOLD=$2
current_value=$3

(
cat << EOF
Message from hostname '$HOSTNAME'

This system is reaching/exceeding the defined '$ALERT_THRESHOLD' threshold value during the last '$ALERT_TIMEINTVL' seconds.

The current value is: $current_value

Please take proper actions to correct this situation.
EOF
) | mail -s "WARNING: Monitorix alert!" $MAILTO

