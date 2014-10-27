#!/bin/bash
set -x #echo on

cassandra_home=/opt/dse/dse-4.5.2

echo "update cassandra"
$cassandra_home/bin/cqlsh -f other/apispark-keyspace-drop.txt
$cassandra_home/bin/cqlsh -f other/apispark-keyspace-create.txt
$cassandra_home/bin/cqlsh -f cassandra/apispark-keyspace-cql.txt
$cassandra_home/bin/cqlsh -f cassandra/apispark-keyspace-data.txt
$cassandra_home/bin/cqlsh -f cassandra/apispark-keyspace-authorizations.txt

echo "update solr"
#curl http://localhost:8983/solr/resource/apispark.DashboardView/solrconfig.xml --data-binary @solr/solrconfig.xml -H 'Content-type:text/xml; charset=utf-8'
#curl http://localhost:8983/solr/resource/apispark.DashboardView/schema.xml --data-binary @solr/schema.xml -H 'Content-type:text/xml; charset=utf-8'
#curl http://localhost:8983/solr/resource/apispark.DashboardView/stopwords.txt --data-binary @solr/stopwords.txt -H 'Content-type:text/xml; charset=utf-8'
#curl http://localhost:8983/solr/resource/apispark.DashboardView/synonyms.txt --data-binary @solr/synonyms.txt -H 'Content-type:text/xml; charset=utf-8'
#curl "http://localhost:8983/solr/admin/cores?action=CREATE&name=apispark.DashboardView"

CORE=apispark.DashboardView
SOLR_URL=http://localhost:8983/solr
#SOLR_AUTH="-u login:password"
SOLR_AUTH=

curl $SOLR_AUTH $SOLR_URL/resource/$CORE/solrconfig.xml --data-binary @solr/solrconfig.xml -H 'Content-type:text/xml; charset=utf-8'
curl $SOLR_AUTH $SOLR_URL/resource/$CORE/schema.xml     --data-binary @solr/schema-dashboard-view.xml     -H 'Content-type:text/xml; charset=utf-8'
curl $SOLR_AUTH $SOLR_URL/resource/$CORE/stopwords.txt  --data-binary @solr/stopwords.txt
curl $SOLR_AUTH $SOLR_URL/resource/$CORE/synonyms.txt   --data-binary @solr/synonyms.txt

# use for creation
curl $SOLR_AUTH "$SOLR_URL/admin/cores?action=CREATE&name=$CORE"
# use for update
#curl $SOLR_AUTH "$SOLR_URL/admin/cores?action=RELOAD&core=$CORE"

CORE=apispark.PersonView
SOLR_URL=http://localhost:8983/solr
#SOLR_AUTH="-u login:password"
SOLR_AUTH=

curl $SOLR_AUTH $SOLR_URL/resource/$CORE/solrconfig.xml --data-binary @solr/solrconfig.xml         -H 'Content-type:text/xml; charset=utf-8'
curl $SOLR_AUTH $SOLR_URL/resource/$CORE/schema.xml     --data-binary @solr/schema-person-view.xml -H 'Content-type:text/xml; charset=utf-8'
curl $SOLR_AUTH $SOLR_URL/resource/$CORE/stopwords.txt  --data-binary @solr/stopwords.txt
curl $SOLR_AUTH $SOLR_URL/resource/$CORE/synonyms.txt   --data-binary @solr/synonyms.txt

# use for creation
curl $SOLR_AUTH "$SOLR_URL/admin/cores?action=CREATE&name=$CORE"
# use for update
#curl $SOLR_AUTH "$SOLR_URL/admin/cores?action=RELOAD&core=$CORE"

