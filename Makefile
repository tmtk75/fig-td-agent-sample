json:
	while true; \
	  do echo '{"hello":"world'`date +%s`'"}' >> in/access.log; \
	  sleep 1; \
	done

ltsv:
	cat access.ltsv >> in/access.log

tcp:
	 nc `docker-machine ip docker-vm` 13337 < access.ltsv
