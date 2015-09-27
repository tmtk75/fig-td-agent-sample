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

es-get:
	curl `docker-machine ip docker-vm`:9200

es-head:
	open http://`docker-machine ip docker-vm`:9200/_plugin/head

kibana:
	open http://`docker-machine ip docker-vm`:5601
