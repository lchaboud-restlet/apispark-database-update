Create or Update Cassandra and Solr
=========================

This script helps to create or update Cassandra and Solr.

Download ZIP of this Github project, add scripts for Cassandra and Solr, configure and execute ```update.sh```

1. Add scripts for Cassandra and Solr
-------

### Cassandra
* in the folder ```cassandra```
  * copy and paste files from the APISpark folder : ```modules\com.apispark.model.cell\resources\cassandra```

### Solr
* in the folder ```solr```
  * copy and paste files from the APISpark folder : ```modules\com.apispark.service.search\resources```

2. Configure update.sh and accounts.sh
-------------

* edit ```update.sh```
  * define the variable ```dse_home```, like ```/opt/dse```, without ```/bin```
* edit ```accounts.sh```
  * define the variable ```dse_home```, like ```/opt/dse```, without ```/bin```

3. Update database
---
* stop APISpark from eclipse
* execute ```./update.sh```

4. Define credentials in ```apispark-console```
---
* in the ```apispark-console``` project :
  * edit your ```dev-config.yaml``` (if it does not exists, see ```README.md``` of ```apispark-console```)
  * in ```user```, define credentials :

```
dev:
  user:
    userkey: fd63410c-69e3-47a2-b35b-7b1ca207ebc7
    password: b0658f8b-0805-4f8a-a1ed-3e98e88cd140
```

5. Start
---
* start APISpark in eclipse
* start APISpark console v2
* go to the config page : 
  * [http://localhost:9000/config](http://localhost:9000/config)
  * choose your user
* go to the dashboard : 
  * [http://localhost:9000/dashboard](http://localhost:9000/dashboard)
  * you can create a new entity store

Annexe. Help if it not works
----

For Solr, see [https://github.com/restlet/apispark/wiki/DSE-4.5-Migration|https://github.com/restlet/apispark/wiki/DSE-4.5-Migration]
