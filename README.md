Update Cassandra and Solr
=========================

Download ZIP of this project, add scripts for Cassandra and Solr, configure and execute ```update.sh```

Add scripts for Cassandra and Solr
-------

### Cassandra
* in the folder ```cassandra```
  * copy and paste files from the APISpark folder : ```modules\com.apispark.model.cell\resources\cassandra```

### Solr
* in the folder ```solr```
  * copy and paste files from the APISpark folder : ```modules\com.apispark.service.search\resources```

Configure update.sh
-------------

* edit ```update.sh```
  * define the variable ```dse_home```, like ```/opt/dse```, without ```/bin```

Run update.sh
---
* execute ```./update.sh```
* the content of the table ```Person``` is displayed to show users data.

Help if it not works
----

For Solr, see [https://github.com/restlet/apispark/wiki/DSE-4.5-Migration|https://github.com/restlet/apispark/wiki/DSE-4.5-Migration]
