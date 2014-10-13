#!/bin/bash
set -x #echo on

cassandra_home=/opt/dse/dse-4.5.2

echo "update cassandra"
$cassandra_home/bin/cqlsh -f other/apispark-keyspace-drop.txt
$cassandra_home/bin/cqlsh -f other/apispark-keyspace-create.txt
$cassandra_home/bin/cqlsh -f cassandra/apispark-keyspace-cql.txt
$cassandra_home/bin/cqlsh -f cassandra/apispark-keyspace-data.txt

echo "update solr"
curl http://localhost:8983/solr/resource/apispark.DashboardView/solrconfig.xml --data-binary @solr/solrconfig.xml -H 'Content-type:text/xml; charset=utf-8'
curl http://localhost:8983/solr/resource/apispark.DashboardView/schema.xml --data-binary @solr/schema.xml -H 'Content-type:text/xml; charset=utf-8'
curl http://localhost:8983/solr/resource/apispark.DashboardView/stopwords.txt --data-binary @solr/stopwords.txt -H 'Content-type:text/xml; charset=utf-8'
curl http://localhost:8983/solr/resource/apispark.DashboardView/synonyms.txt --data-binary @solr/synonyms.txt -H 'Content-type:text/xml; charset=utf-8'
curl "http://localhost:8983/solr/admin/cores?action=CREATE&name=apispark.DashboardView"
