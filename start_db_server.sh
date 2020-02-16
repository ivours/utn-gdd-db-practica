MSSQL_USERNAME=$(cat resources/CREDENTIALS | grep MSSQL_USERNAME | cut -d "=" -f 2)
MSSQL_PASSWORD=$(cat resources/CREDENTIALS | grep MSSQL_PASSWORD | cut -d "=" -f 2)

docker pull mcr.microsoft.com/mssql/server:2019-latest
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD='$MSSQL_PASSWORD -e 'MSSQL_PID=Express' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest | tail -1 > CONTAINER_ID
sleep 10
docker cp resources/db.bak $(cat CONTAINER_ID):/var/opt/mssql/data
sqlcmd -H localhost:1433 -U $MSSQL_USERNAME -P $MSSQL_PASSWORD -Q "RESTORE DATABASE GDD_DB FROM DISK = '/var/opt/mssql/data/db.bak' WITH MOVE 'GESTION2009_Data' TO '/var/opt/mssql/data/GD2015C1_Data.mdf', MOVE 'GESTION2009_Log' TO '/var/opt/mssql/data/GD2015C1_Log.ldf'"
