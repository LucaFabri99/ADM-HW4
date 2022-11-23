# 1. Which location has the maximum number of purchases been made?

#Let's take only the column 'CustLocation', then we sort and count unique values, then sort by number in descending order and take the first row. 
#Since the row contains the count, we cut it and we get only the name which is in the column 2.
echo The location that has the maximum number of purchases been made is $(cut -f 5 bank_transactions.tsv | sort | uniq -c | sort -nr | head -n 1 | cut -d' ' -f2)



# 2. In the dataset provided, did females spend more than males, or vice versa?

#Let's take only the column 'CustGender' and 'CustAccountBalance'.
#Let's get the rows that contain 'M' and let's sum all the CustAccountBalance.
echo Males have spent $( cut -f 4,9 bank_transactions.tsv | grep 'M' | awk '{total += $2}END{print total}')

#Let's take only the column 'CustGender' and 'CustAccountBalance'.
#Let's get the rows that contain 'F' and let's sum all the CustAccountBalance.
echo Females have spent $( cut -f 4,9 bank_transactions.tsv | grep 'F' | awk '{total += $2}END{print total}') 


# 3. Report the customer with the highest average transaction amount in the dataset.

#Let's take only the column 'CustomerID' and 'TransactionAmount (INR), then with awk we compute the average transactions of every customer.
#Then we sort in descending order, and we get the first row. 
#As we did for the Q1, since the average transactions is in the row, we cut it and we take only the CustomerID

echo The customer with the highest average transaction amount in the dataset is $(cut -f 2,9 bank_transactions.tsv | awk '{a[$1]+=$2; c[$1]++} END{for(i in a) print i, a[i]/c[i]}' | sort -k 2 -gr | head -n 1 | cut -d' ' -f1)


# In order to check the results, run the code below which allows a better visualitazion
echo  ; echo The location that has the maximum number of purchases been made is $(cut -f 5 bank_transactions.tsv | sort | uniq -c | sort -nr | head -n 1 | cut -d' ' -f2) ; echo; echo Males have spent $( cut -f 4,9 bank_transactions.tsv | grep 'M' | awk '{total += $2}END{print total}'); echo; echo Females have spent $( cut -f 4,9 bank_transactions.tsv | grep 'F' | awk '{total += $2}END{print total}'); echo; echo The customer with the highest average transaction amount in the dataset is $(cut -f 2,9 bank_transactions.tsv | awk '{a[$1]+=$2; c[$1]++} END{for(i in a) print i, a[i]/c[i]}' | sort -k 2 -gr | head -n 1 | cut -d' ' -f1) with $(cut -f 2,9 bank_transactions.tsv | awk '{a[$1]+=$2; c[$1]++} END{for(i in a) print i, a[i]/c[i]}' | sort -k 2 -gr | head -n 1 | cut -d' ' -f2) transactions on average
