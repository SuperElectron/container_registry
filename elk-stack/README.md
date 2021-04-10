![docker](https://img.shields.io/badge/docker-19.03.8-blue)

------
# ELK Stack with Kafka
- *ELK*: `logstash => elasticsearch => kibana`
- kafka from `mist-1b/mist-alpha`

# Table of contents
1. [Introduction](#Introduction)
2. [Development](#Development)

# Introduction
- noop

# Development

__quick-start__

```bash
sudo make start
```

__stdin to Kibana__

- start the stdin reader to connect with ELK stack
- it will take a bit, then enter `hello world!` as shown below
```bash
sudo docker exec -it elk bash -c "/opt/logstash/bin/logstash --path.data /tmp/logstash/data -e 'input { stdin { } } output { elasticsearch { hosts => ["localhost"] } }'"
...
...
[2020-07-05T21:07:54,566][INFO ][logstash.agent           ] Successfully started Logstash API endpoint {:port=>9601}
hello world!
```

- go to Kibana at http://localhost:5601/app/kibana#/management/kibana/index_patterns
- *step 1*: create an index pattern named `logstash-*`
- *step 2*: configure the pattern to `@timestamp`
- view logs (`hello world!`) at http://localhost:5601/app/kibana#/discover
- view ElasticSearch entry of `hello world!` at http://localhost:9200/_search?pretty&size=1000

__kafka to Kibana__

- you should be able to see it once the message is sent
```bash
sudo docker exec -it kafkacat kafkacat -b kafka0:29092 -t test -C
```

- run `kafkacat` to publish messages
```bash
sudo docker exec -it kafkacat kafkacat -b kafka0:29092 -t test -P
```


- give your kafka setup a test go
```bash
sudo docker exec -it elk bash 
/opt/logstash/bin/logstash --path.data /tmp/logstash/data2 -e 'input { kafka { bootstrap_servers => "kafka0:29092" topics => ["test"]  }} output { elasticsearch { hosts => ["localhost"]}}'
```
- add a few lines to the kafka consumer
```bash
sudo docker exec -it kafkacat kafkacat -b kafka0:29092 -t test -P
hello world number 1
hello world number 2
hello world number 3
```

- create an Kibana as shown above with the same configs
- view the logs at http://localhost:5601/app/kibana#/discover

- change `logstash.conf` and run `sudo make start` to rebuild images
```bash
input {
    kafka {
        bootstrap_servers => "kafka0:29092"
        topics => ["test"]
    }
}

output {
    elasticsearch {
        hosts => "kafka0:29092"
        index => "test"
    }
}
```

