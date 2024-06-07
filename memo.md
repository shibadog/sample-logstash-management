# Logstash managementでnon_runnringに意図せず行ってしまう事象について

## overview

Logstash managementを用いて、Kibanaからパイプライン設定を追加していた。  
今まではうまく行っていたのだが、パイプラインを追加する作業を行った後、追加したパイプラインが意図せずに実行対象外になってしまった。

実行対象に入っていたものが、パイプライン追加に伴い、対象外になってしまうため、何らかの上限設定に抵触しているのではないか、検証してみる。

## 検証環境

docker composeで環境を立ち上げる。

一応、JDBC Pluginを用いてパイプラインを作成するためH2 Database のServerを立ち上げる。

compose.ymlを実行し、 `test01-pipeline.conf` を KibanaからLogstash Managementに設定する。

これを複製し、30パイプラインほど用意した。

## 結果

結果、状況が再現されなかった。

```
2024-06-07 12:30:31 [2024-06-07T03:30:31,106][INFO ][logstash.agent           ] Pipelines running {:count=>29, :running_pipelines=>[:".monitoring-logstash", :test01, :test02, :test03, :test04, :test05, :test06, :test07, :test08, :test09, :test10, :test11, :test12, :test13, :test14, :test15, :test16, :test17, :test18, :test19, :test20, :test21, :test22, :test23, :test24, :test26, :test27, :test28, :test29], :non_running_pipelines=>[]}
```