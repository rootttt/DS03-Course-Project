---
title: "README"
author: "evoletttt (Lovette Regner)"
date: "Saturday, July 26, 2014"
output: pdf_document
---

#SUMMARY
The experiment measured the 3-axial linear acceleration and 3-axial angular velocity (at a constant rate of 50Hz) of thirty volunteers performing six activities: walking, walking upstairs, walking downstairs, sitting, standing and laying. These were measured using the embedded accelerometer and gyroscope of Samsung Galaxy SII units worn on their waists. The tidy data consist of the means of the means and standard deviations of the measurement variables per subject and activity combination.

The codes embedded in this markdown file are only meant to highlight and clarify. Please refer to the R file for the complete code.



# 1. Load and unzip dataset in working directory.
## The downloaded zip becomes a new folder inside the working directory.


# 2. Load and merge training files.
## After loading, combine through cbind in new variable 'all'.
```{r train}
all <- cbind(sub, y, X)
```


# 3. Load and merge training files.
## Combine variables containing read text files with cbind in new variable 'temp'.
## Combine with training data, applying 'rbind' to 'all'.
```{r test}
temp <- cbind(sub, y, X)
all <- rbind(all, temp)
```


# 4. Label the columns.
## Use column names from features.txt for the variables from X, and concatenating 'Subject' and 'Activity'.
## Apply column names to the 'all' data frame.
```{r label}
feat <- read.table("features.txt")
labels <- c("Subject", "Activity", as.vector(feat[,2]))
colnames(all) <- labels
```


# 5. Create a new dataset with the mean/stdev summary variables and labels
## First, subset the 'Subject' and 'Activity' variables to a new variable 'summary'.
## Next, subset the summary variables and add to the 'summary' data frame.
### From the 561 'X' variables in 'all', there are 18 variable sets that can be further clustered into 5 types.
The reference used was features_info.txt, which is included in the UCI HAR Dataset. The variables in a variable set are its computed properties. The variable combinations are the same within variable types. The column variables are arranged by variable set: VarSet1-Var1, VarSet1-Var2, VarSet1-Var3, Varset2-Var1, VarSet2-Var2, and so on. The means and stdevs can be found in the first few variables of each variable set. The 3-AXIAL types have three sets of means and stdevs representing the XYZ axes. The computed angles type were excluded from the new dataset because they have no corresponding std() variables.
#### Type 1: UNTRANSFORMED 3-AXIAL (5 variable sets, 40 variables per set, 3 means per set, 3 stdevs per set)
#### Type 2: UNTRANSFORMED MAGNITUDE (5 variable sets, 13 variables per set, 1 mean per set, 1 stdev per set)
#### Type 3: TRANSFORMED 3-AXIAL (3 variable sets, 79 variables per set, 3 means per set, 3 stdevs per set)
#### Type 4: TRANSFORMED MAGNITUDE (4 variable sets, 13 variables per set, 1 mean per set, 1 stdev per set)
#### Type 5: COMPUTED ANGLES (5 variable sets, 1 variable per set, 1 mean per set, 0 stdevs per set)
```{r template}
# Template code for adding summary variables of 'Type X' to 'summary'
for (i in 1:numOfVarSetsInTypeX) {
      colnum <- startingColumnNumberOfTypeX + (i-1)*variablesPerSet
      summary <- c(summary, all[,colnum:(colnum + (numberOfMeans + numberOfStdevs - 1)])
    }
```


# 6. Convert activity code to factor label.
## Get activity labels from "activity_labels.txt"
## Subset the second column only because it is the one that contains the actual labels.
## Apply factors to 'Activity', using the loaded data as labels.
```{r activity}
actFactors <- read.table("activity_labels.txt")
actFactors <- as.vector(actFactors[,2])
summary$Activity <- factor(summary$Activity, labels = actFactors)
```


# 7. Create new dataset summarised by activity and subject
## Apply the aggregate function to 'summary' by indexing 'Subject' and 'Activity' and using mean as the function.
## The function appends the tidy indices as the first two columns. Thus, we have to delete the original two columns which are now the third and fourth columns.
## Finally, reapply the column names because the function stripped the original column names.
``` {r final}
final <- aggregate(summary, by = list(summary$Subject, summary$Activity), mean)
final <- final[,-c(3,4)]
colnames(final)[1:2] <- c("Subject", "Activity")
```


# 8. Save the data set as a text file, as per the instruction.
```{r save}
write.table(final, "tidy.txt")
```