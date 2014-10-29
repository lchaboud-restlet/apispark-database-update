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

# define user with :
# -> apiToken / userkey : 'f0ba46b5-d928-4e19-8c4d-0fa047415'
# -> userToken / password : 'a70ec5d3-d58b-44d5-9dd0-d59a52202'
$cassandra_home/bin/cqlsh -f other/user-create.txt

echo ""
echo "Users : "
echo ""
$cassandra_home/bin/cqlsh -f other/user-select.txt
