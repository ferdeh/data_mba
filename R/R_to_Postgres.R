library(DBI)
library(RPostgreSQL)
con<-dbConnect(dbDriver("PostgreSQL"), dbname="maintenance", host="localhost", port=5432, user="postgres",password="postgres")

dbListTables(con)
query <- dbGetQuery(con, "SELECT * FROM geo_miv_header")
query