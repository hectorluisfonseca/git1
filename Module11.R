install.packages("DBI")
install.packages("RSQLite")

library(DBI)
setwd("C:/my_project")


download.file("https://github.com/KristenKehrer/datamovesme-sqlcourse/raw/gh-pages/assets/sqlcourse.db", 
              "./sqlcourse.db", 
              mode = "wb")


con <- dbConnect(RSQLite::SQLite(), "./sqlcourse.db")


dbListTables(con)
dbReadTable(con, "salescall")


# Run a query on the database
queryResult <- dbSendQuery(con, "select max(customer_id) from salescall")
dbFetch(queryResult)


