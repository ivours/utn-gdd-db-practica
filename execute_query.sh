MSSQL_USERNAME=$(cat resources/CREDENTIALS | grep MSSQL_USERNAME | cut -d "=" -f 2)
MSSQL_PASSWORD=$(cat resources/CREDENTIALS | grep MSSQL_PASSWORD | cut -d "=" -f 2)

QUERY=$1

sqlcmd -H localhost:1433 -U $MSSQL_USERNAME -P $MSSQL_PASSWORD -d GDD_DB -Y 30 -Q "$(cat $QUERY)"