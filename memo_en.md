# Issue with unintentionally becoming non_running in Logstash management

## Overview

Using Logstash management, I was adding pipeline settings from Kibana. Although it was working fine before, after adding a pipeline, the newly added pipeline unintentionally became non-running.

Pipelines that were running before became non-running after adding new ones, so I suspect it might be hitting some kind of limit. I will investigate this.

## Test Environment

I will set up the environment using Docker Compose.

To create pipelines using the JDBC Plugin, I will also set up an H2 Database server.

Execute the `compose.yml` and set `test01-pipeline.conf` in Logstash Management from Kibana.

I duplicated this to create about 30 pipelines.

## Results

As a result, the situation was not reproduced.

```
2024-06-07 12:30:31 [2024-06-07T03:30:31,106][INFO ][logstash.agent           ] Pipelines running {:count=>29, :running_pipelines=>[:".monitoring-logstash", :test01, :test02, :test03, :test04, :test05, :test06, :test07, :test08, :test09, :test10, :test11, :test12, :test13, :test14, :test15, :test16, :test17, :test18, :test19, :test20, :test21, :test22, :test23, :test24, :test26, :test27, :test28, :test29], :non_running_pipelines=>[]}
```

## Reference

### Various Endpoints

* [Kibana](http://localhost:5601)
  * `elastic/elastic`
* [Elasticsearch](https://localhost:9200)
  * `elastic/elastic`
* [H2 Database](http://localhost:8082)
  * `Generic H2 (Server)`
  * `jdbc:h2:tcp://localhost//opt/h2/data/testdb`
  * `sa/`