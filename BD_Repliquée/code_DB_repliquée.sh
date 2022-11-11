docker run -dti -p 4000:5432 --name postgresql-master ^
  -e POSTGRESQL_REPLICATION_MODE=master ^
  -e POSTGRESQL_USERNAME=sackoba ^
  -e POSTGRESQL_PASSWORD=badra ^
  -e POSTGRESQL_DATABASE=my_database ^
  -e POSTGRESQL_REPLICATION_USER=replicationsackoba ^
  -e POSTGRESQL_REPLICATION_PASSWORD=allou ^
  bitnami/postgresql:latest

docker run -dti -p 4001:5432 --name postgresql-slave1 ^
  --link postgresql-master:master ^
  -e POSTGRESQL_REPLICATION_MODE=slave ^
  -e POSTGRESQL_USERNAME=sackoba ^
  -e POSTGRESQL_PASSWORD=badra ^
  -e POSTGRESQL_MASTER_HOST=master ^
  -e POSTGRESQL_MASTER_PORT_NUMBER=5432 ^
  -e POSTGRESQL_REPLICATION_USER=replicationsackoba  ^
  -e POSTGRESQL_REPLICATION_PASSWORD=allou ^
  bitnami/postgresql:latest

docker run -dti -p 4002:5432 --name postgresql-slave2 ^
  --link postgresql-master:master ^
  -e POSTGRESQL_REPLICATION_MODE=slave ^
  -e POSTGRESQL_USERNAME=sackoba ^
  -e POSTGRESQL_PASSWORD=badra ^
  -e POSTGRESQL_MASTER_HOST=master ^
  -e POSTGRESQL_MASTER_PORT_NUMBER=5432 ^
  -e POSTGRESQL_REPLICATION_USER=replicationsackoba ^
  -e POSTGRESQL_REPLICATION_PASSWORD=allou ^
  bitnami/postgresql:latest

 docker run -dti -p 4003:5432 --name postgresql-slave3 ^
  --link postgresql-master:master ^
  -e POSTGRESQL_REPLICATION_MODE=slave ^
  -e POSTGRESQL_USERNAME=sackoba ^
  -e POSTGRESQL_PASSWORD=badra ^
  -e POSTGRESQL_MASTER_HOST=master ^
  -e POSTGRESQL_MASTER_PORT_NUMBER=5432 ^
  -e POSTGRESQL_REPLICATION_USER=replicationsackoba ^
  -e POSTGRESQL_REPLICATION_PASSWORD=allou ^
  bitnami/postgresql:latest

docker run -dti -p 4004:5432 --name postgresql-slave4 ^
  --link postgresql-master:master ^
  -e POSTGRESQL_REPLICATION_MODE=slave ^
  -e POSTGRESQL_USERNAME=sackoba ^
  -e POSTGRESQL_PASSWORD=badra ^
  -e POSTGRESQL_MASTER_HOST=master ^
  -e POSTGRESQL_MASTER_PORT_NUMBER=5432 ^
  -e POSTGRESQL_REPLICATION_USER=replicationsackoba ^
  -e POSTGRESQL_REPLICATION_PASSWORD=allou ^
  bitnami/postgresql:latest