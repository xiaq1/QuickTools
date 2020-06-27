#!/bin/bash
SLEEP_INTERVAL=120
function get_dev_wa() {
	#while true
	for ((i=0;i<2;i++))
	do
		bdev=$1
		host_writes_delta=0
		nand_writes_delta=0
		cur_data=`./nvme intel smart-log-add $1 | tail -n 2 | awk '{print $5}'`;
		nand_bytes_written=`echo $cur_data | awk '{print $1}'`
		host_bytes_written=`echo $cur_data | awk '{print $2}'`
		#echo "nand_bytes_written: $nand_bytes_written"
		#echo "host_bytes_written: $host_bytes_written"
		#echo "Now begein run fio...."
		sleep $SLEEP_INTERVAL
		#date
		latest_cur_data=`./nvme intel smart-log-add $1 | tail -n 2 | awk '{print $5}'`;
		latest_nand_bytes_written=`echo $latest_cur_data | awk '{print $1}'`
		latest_host_bytes_written=`echo $latest_cur_data | awk '{print $2}'`
		#echo "latest_nand_bytes_written: $latest_nand_bytes_written"
		#echo "latest_host_bytes_written: $latest_host_bytes_written"
		nand_writes_delta=$[ latest_nand_bytes_written - nand_bytes_written ]
		host_writes_delta=$[ latest_host_bytes_written - host_bytes_written ]
		#if [[ host_writes_delta -eq 0 ]]
		if ((host_writes_delta == 0))
		then
			host_writes_delta=1
		fi
		#echo "nand_writes_delta:$nand_writes_delta"
		#echo "host_writes_delta:$host_writes_delta"
        date
		devname=${bdev##*/}
		am=$[ 100 * nand_writes_delta / host_writes_delta ]
		echo "${devname}_host_to_nand_wa_percent:$am"
	done
	#echo "call $bdev done"
}

main() {
	for dev in `ls /dev/nvme*n1`
	do
		#echo $dev
		get_dev_wa $dev &
	done
}

main
