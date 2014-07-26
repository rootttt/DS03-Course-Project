# Load and unzip dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "UCIHAR.zip")
unzip("UCIHAR.zip")
setwd("C:/Users/Lovette Regner/Documents/DS03/UCI HAR Dataset")


# Load and merge training files
setwd("C:/Users/Lovette Regner/Documents/DS03/UCI HAR Dataset/train")
y <- read.table("y_train.txt")
X <- read.table("X_train.txt")
sub <- read.table("subject_train.txt")
all <- cbind(sub, y, X)


# Load and merge testing files
setwd("C:/Users/Lovette Regner/Documents/DS03/UCI HAR Dataset/test")
y <- read.table("y_test.txt")
X <- read.table("X_test.txt")
sub <- read.table("subject_test.txt")
temp <- cbind(sub, y, X)
all <- rbind(all, temp)


# Name columns
setwd("C:/Users/Lovette Regner/Documents/DS03/UCI HAR Dataset")
feat <- read.table("features.txt")
labels <- c("Subject", "Activity", as.vector(feat[,2]))
colnames(all) <- labels


# Create a new dataset with the mean/stdev summary variables and labels
  ## Get the subject and activity variables
  summary <- all[,1:2]

  ## Actual summary variables:
    ### From the 561 X variables, there are 18 variable sets that can be further clustered into 5 types. More details in the README file.
    ### Type 1: UNTRANSFORMED 3-AXIAL (5 variable sets, 40 variables per set, 3 means per set, 3 stdevs per set)
    for (i in 1:5) {
      colnum <- 3 + (i-1)*40
      summary <- c(summary, all[,colnum:(colnum+5)])
    }
    
    ### Type 2: UNTRANSFORMED MAGNITUDE (5 variable sets, 13 variables per set, 1 mean per set, 1 stdev per set)
    for (i in 1:5) {
      colnum <- 203 + (i-1)*13
      summary <- c(summary, all[,colnum:(colnum+1)])
    }
    
    ### Type 3: TRANSFORMED 3-AXIAL (3 variable sets, 79 variables per set, 3 means per set, 3 stdevs per set)
    for (i in 1:3) {
      colnum <- 268 + (i-1)*79
      summary <- c(summary, all[colnum:(colnum+5)])
    }

    ### Type 4: TRANSFORMED MAGNITUDE (4 variable sets, 13 variables per set, 1 mean per set, 1 stdev per set)
    for (i in 1:4) {
      colnum <- 505 + (i-1)*13
      summary <- c(summary, all[colnum:(colnum+1)])
    }

    ### Type 5: COMPUTED ANGLES (5 variable sets, 1 variable per set, 1 mean per set, 0 stdevs per set)
    #### Not Included because no stdevs


# Convert activity code to factor label
actFactors <- read.table("activity_labels.txt")
actFactors <- as.vector(actFactors[,2])
summary$Activity <- factor(summary$Activity, labels = actFactors)


# Create new dataset summarised by activity and subject
final <- aggregate(summary, by = list(summary$Subject, summary$Activity), mean)
final <- final[,-c(3,4)]
colnames(final)[1:2] <- c("Subject", "Activity")


# Save tidy set
write.table(final, "tidy.txt")