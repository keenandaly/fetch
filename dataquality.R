# Data Quality Evaluation

## Keenan Daly

##### Clear Environment

```{r}
rm(list = ls())
```

##### Load packages

```{r}
library("jsonlite")
```

##### 1.) Read in JSON files

```{r}
receipts <- stream_in(file("receipts.json"))
brands <- stream_in(file("brands.json"))
users <- stream_in(file("users.json"))
```

##### 2.) Convert JSON lists into dataframes for preprocessing

```{r}
class(users) <- "data.frame"
class(brands) <- "data.frame"
class(receipts) <- "data.frame"

users_df <- users
brands_df <- brands
receipts_df <- receipts
```

## DATA QUALITY ISSUE 1

##### The primary key (the IDs) of each file are stored a table with ID's single value.

##### Begin by collapsing the nests so that the ID column contains a string and not a data frame.

##### Pull receipt ID's from the 1 row data frame it is stored in.

```{r}
receipt_ID <- receipts_df[[1, 1]]
receipts_df$receiptID <- receipt_ID
receipts_df$`_id` <- NULL
```

##### Pull user ID's from the 1 row dataframe it is stored in

```{r}
user_ID <- users_df[[1, 1]]
users_df$userID <- user_ID
users_df$`_id` <- NULL

```

##### Pull user ID's from the 1 row dataframe it is stored in

```{r}
brand_ID <- brands_df[[1, 1]]
brands_df$brandID <- brand_ID
brands_df$`_id` <- NULL
```

## DATA QUALITY ISSUE #2

##### Upon viewing receipts_df, the rewardsReceiptItemList variable stood out.

##### Because this is a nested JSON file, this variable contains another level of information.

##### However, it appears that each row holds an inconsistent \# of variables in this column.

##### Print the first nest value for the first 3 rows in receipts_df

```{r}
receipts_df[[1,11]][1, 1]
receipts_df[[2,11]][1, 1]
receipts_df[[3,11]][1, 1]
```

##### Data in first 3 positions contains different data types

##### Next I will print the column names of those first 3 rows

```{r}
colnames(receipts_df[[1,11]])
colnames(receipts_df[[2,11]])
colnames(receipts_df[[3,11]])
```

##### This output affirms that there is an inconsistency in the structures of the nests.

##### Essentially the positions of the columns are different for each row and some entries contain different variables.

##### In order to achieve normalized database, this data will have to be structured.
