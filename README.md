Update Cassandra and Solr
=========================

Download ZIP of this Github project, add scripts for Cassandra and Solr, configure and execute ```update.sh```

Add scripts for Cassandra and Solr
-------

### Cassandra
* in the folder ```cassandra```
  * copy and paste files from the APISpark folder : ```modules\com.apispark.model.cell\resources\cassandra```

### Solr
* in the folder ```solr```
  * copy and paste files from the APISpark folder : ```modules\com.apispark.service.search\resources```

Configure update.sh and accounts.sh
-------------

* edit ```update.sh```
  * define the variable ```dse_home```, like ```/opt/dse```, without ```/bin```
* edit ```accounts.sh```
  * define the variable ```dse_home```, like ```/opt/dse```, without ```/bin```

Update database
---
* stop APISpark from eclipse
* execute ```./update.sh```
* start APISpark in eclipse
* go to the signin page of APISpark, like :
  * http://gblondeau.com:8182/signin
* after authentication, execute ```account.sh``` :
  * it displays the content of the table ```Person``` is displayed to show users data.
* in the ```apispark-console``` project :
  * edit ```userAccountsService.js```
  * in ```basicAuthUsers```, define ```Thierry``` credentials :
	* ```userkey``` : copy and paste the content of ```userToken``` of the ```Person``` table
	* ```password``` : copy and paste the content of ```apiToken``` of the ```Person``` table
* go on the config page : 
  * http://localhost:9000/config 
  * choose ```Thierry```
* go to the dashboard : 
  * http://localhost:9000/dashboard
  * you can create a new entity store

Help if it not works
----

For Solr, see [https://github.com/restlet/apispark/wiki/DSE-4.5-Migration|https://github.com/restlet/apispark/wiki/DSE-4.5-Migration]
