# practice1-database

SQL files and commands to create a practice database and tables,insert data and create views and events.

## Create the database, tables and insert data

Run the create databas, tables and data sql file.

```
mysql < create_database_tables_data.sql
```

## Create views practice

```
mysql < views.sql
```

## Create events practice

```
mysql < events.sql
```

## MySQL Guidance

Details on how to install mysql and authenticate (if needed).

### Install MySQL

MySQL can be installed via brew

```
brew install mysql
brew services start mysql
```

### Username / Password authentication

If mysql has authenticaton enabled, you can include your password in the command line.

```
mysql -p < create_database_tables_data.sql
```
