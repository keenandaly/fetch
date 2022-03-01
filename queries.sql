--- QUERY 1: When considering average spend from receipts with 'rewardsReceiptStatus' of 'Accepted' or 'Rejected', which is greater?
SELECT rewardsReceiptStatus, ROUND(AVG(totalSpent), 2)  AS AverageSpend
FROM RECEIPTS
WHERE rewardsReceiptStatus = 'FINISHED'
OR rewardsReceiptStatus = 'REJECTED'
GROUP BY rewardsReceiptStatus;

--- Accepted receipts contain 447 more items than receipts that were rejected

--- QUERY 2: When considering total number of items purchased from receipts with 'rewardsReceiptStatus' of 'Accepted' or 'Rejected', which is greater?
SELECT rewardsReceiptStatus, COUNT(purchasedItemCount)  AS ItemsPurchased
FROM RECEIPTS
WHERE rewardsReceiptStatus = 'FINISHED'
OR rewardsReceiptStatus = 'REJECTED'
GROUP BY rewardsReceiptStatus;

--- Accepted receipts contain 447 more items than receipts that were rejected





--- Oracle Apex was used for SQL code