json:
	while true; \
	  do echo '{"hello":"world'`date +%s`'"}' >> in/access.log; \
	  sleep 1; \
	done

access:
	cat access.ltsv >> in/access.log

slow:
	cat slow.ltsv >> in/access.log

http:
	curl localhost:8080/Makefile
	curl localhost:8080/docker-compose.yml
	curl localhost:8080/missing

kibana:
	open http://localhost:5601
