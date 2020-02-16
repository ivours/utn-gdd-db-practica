# UTN - DB Practica GDD dockerizada

Conjunto de scripts que permiten:
- Descargarse una imagen de docker base con MSSQL.
- Inicializar la DB con los datos que provee la cátedra para poder realizar la práctica.
- Conectarse a la DB para hacer consultas en modo interactivo o bien hacer consultas enviando queries por parametro a sqlcmd.

## Requisitos

- docker
- sqlcmd
- mssql-cli

## Instrucciones de uso

Descargar la imagen e inicializar la DB:

``` ./start_db_server.sh ```

Conectarse al container:

``` ./connect_to_container.sh ```

Conectarse a al servidor de base de datos en modo interactivo:

``` ./connect_to_db.sh ```

Ejecutar query desde archivo:

``` ./execute_query.sh myQuery.sql ```

## Aclaraciones

Al realizar consultar utilizando ```execute_query.sh``` puede suceder que las columnas superen el ancho de la terminal. Se puede salvar esto modificando el tamaño de fuente de la terminal o bien cambiando el valor del parámetro -Y en ```execute_query.sh```. Por defecto se establece un límite de 30 caracteres por columna.