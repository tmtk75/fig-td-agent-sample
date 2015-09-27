json:
	while true; \
	  do echo '{"hello":"world'`date +%s`'"}' >> in/access.log; \
	  sleep 1; \
	done

ltsv:
	cat access.ltsv >> in/access.log

curl:
	curl `docker-machine ip docker-vm`:8080/README.md

tcp:
	nc `docker-machine ip docker-vm` 13337 < access.ltsv

ps:
	docker-compose ps
