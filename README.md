Create jooq code from a sql file
================================

How I'm running it
------------------
```
mvn exec:java -Dexec.mainClass="org.jooq.codegen.GenerationTool" -Dexec.args="src/main/resources/jooq-config.xml"
```

How I got the schema file
-------------------------
```
pg_dump "host=<hostname> dbname=ams-reporting-metrics user=ams-reporting-metrics sslcert=<cert> sslkey=<key> sslrootcert=<rootcert> sslmode=verify-full" -s -n public > src/main/resources/schema.sql
```
