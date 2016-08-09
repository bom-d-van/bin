ps -aef | sed 1d | while read p; do
		name=`echo $p | awk '{print $8}'`
        pid=`echo $p | awk '{print $2}'`
		count=`lsof -p "$pid" | wc -l`
		echo $count $name
done
