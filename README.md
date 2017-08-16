# README

Open three terminals like [1], [2] and [3].

    [1]$ docker-compose up

    [2]$ make ltsv

    [3]$ cat out/*.log

## Data flow
```
        nginx/access.log           in/access.log
                |                       |
              in_tail                 in_tail
                |                       |
                +-----------+-----------+
                            |
                            v
                      td-agent send
                            |
                            v
                      td-agent recv
                            |
       +--------------------+--------------------+
       |                    |                    |
    out_file             out_stdout           out_elasticsearch
       |                                         |
       v                                         v
out/accesss.log-*                              http://es:9200/
```

##
```
[0]$ docker-compose up
...

[1]$ make access slow http
...
[1]$ open http://localhost:5601
```
