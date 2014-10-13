Update Cassandra and Solr
=========================

Configuration
-------------

* edit ```update.sh```
  * define the variable ```dse_home```, like ```/opt/dse```, without ```/bin```

Scripts
-------

### Cassandra
* in the folder ```cassandra```
  * copy and paste files from the APISpark folder : ```modules\com.apispark.model.cell\resources\cassandra```

### Solr
* in the folder ```solr```
  * copy and paste files from the APISpark folder : ```modules\com.apispark.service.search\resources```

Run
---
* execute ```./update.sh```
