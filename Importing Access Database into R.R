# R version 4.1.2 (2021-11-01) -- "Bird Hippie"
# R Studio version 1.4.1717
# Shefali Vishwakarma 02-12-2022

install.packages(“RODBC”)
# RODBC -- ODBC Database Access version 1.3-19

# Ensure relavent ODBC drivers are installed in computer

# Two ways to obtain ODBC driver information
#		Provide all the relevant information from within R each time the connection to the database system is established
#		Or, establish a DSN (Data Source Name) so that the DSN describes the connection

# Control Panel\Administrative Tools\Data Sources (ODBC)
# Under the Driver's tab, the Connectors available and names used to access them on a particular machine are given as a list

# Example
# Path to MS Access database: C:\Users\Documents\Database.accdb
# To establish the DSN:
# 	1. Click Add under the User DSN tab to establish a specific DSN
# 	2. Choose the Microsoft Access Driver (*.mdb, *.accdb) from the list
# 	3. Click Finish
# 	4. Enter additional information required for the connection on the dialogue that opens (i.e. Name, Description, etc.)
# 	5. Click Select to set the path to the database, and click OK
# 	6. Click OK
#	7. Click OK


################## Approach 1 ##################
# Note: The Data Source Name entered in the dialogue from Step 4 is DataSourceName

library(RODBC)
con <- odbcConnect("DataSourceName")

################## Approach 2 ##################

library(RODBC)

 db <- "C:/Users/Sandy/Documents/SST/Database/Database for playing.accdb"
 con2 <- odbcConnectAccess2007(db)

################################################################################################

sqlTables(con2, tableType = “TABLE”)$TABLE_NAME
# View table names

dt <- sqlFetch(con2, "Sheet-1")
str(Sheet-1)

qry <- "SELECT * FROM class"
class <- sqlQuery(con2, qry)
str(class)

# Insert table name retrieved from sqlTables
# Import the Access database to R
