library(dplyr); library(data.table)


# Flexible function to load various types of files
loadFile <- function(directory, fileName, class, numRows) {
      fullPath <- paste(directory, "/", fileName, sep = "")
      loadFile <- fread(fullPath, colClasses = class, header = FALSE)
      loadFile
}

# The data provided includes duplicated column names which we need to sanitize as they crash dplyr.
# This functions adds a suffix to the column name which is equal to the count of this name.
renameDuplicates <- function(df) {
      
      namesAll <- names(df)
      namesUnique <- unique(namesAll)
      mapNames <- data.frame("names" = namesUnique, "count" = rep(0, length(namesUnique)))
      
      for(i in 1 : length(namesAll)) {
            duplIndex <- which(mapNames$names == namesAll[i])
            mapNames[duplIndex, "count"] <- mapNames[duplIndex, "count"] + 1
            if(mapNames[duplIndex, "count"] > 1) {
                  namesAll[i] <- paste(namesAll[i], as.character(mapNames[duplIndex, "count"] - 1), 
                                       sep = "_")
            }
      }
      names(df) <- namesAll
      df
}

# Load training and test sets and bind them using dplyr's bind_rows method (step 1):
dir1 <- "./UCI HAR Dataset/train"
dir2 <- "./UCI HAR Dataset/test"
mainDir <- "./UCI HAR Dataset"
X_complete <- bind_rows(loadFile(dir1, "X_train.txt", "numeric", 7500), 
                     loadFile(dir2, "X_test.txt", "numeric", 3000))

# Load features.txt, listing all 561 features, an use it to name the data set columns:
features <- loadFile(mainDir, "features.txt", "character", 600)
varNames <- unlist(select(features, 2))
names(X_complete) <- varNames

# Rename any duplicate features:
X_complete <- renameDuplicates(X_complete)


# Extract only measurements on mean and std deviation for each measurement (Step 2). Note that there
# are vector angle variables whose names contain the character chain "mean" but are not actually 
# means. For this reason, we look up "mean()" to return only actual mean values.
selectSet <- bind_cols(select(X_complete, contains("mean()")), select(X_complete, contains("std()")))


# Before moving to step 3, need to load the training and test labels as well as the activity names:
actNames <- loadFile(mainDir, "activity_labels.txt", c("numeric", "character"), 6)
y_complete <- bind_rows(loadFile(dir1, "y_train.txt", "numeric", 7500), 
                         loadFile(dir2, "y_test.txt", "numeric", 3000))
y_complete <- inner_join(y_complete, actNames)
names(y_complete) <- c("activityLabel", "activityName")


# Binding the y_complete table to the selectSet data set (step 3):
selectSet <- bind_cols(y_complete, selectSet)

# Create a new data set with average of each variable, grouped by activity and subject (step 5):
# First, add the subject information:
subject <- bind_rows(loadFile(dir1, "subject_train.txt", "numeric", 7500), 
                         loadFile(dir2, "subject_test.txt", "numeric", 3000))
names(subject) <- "subject"

# Then create a copy of selectSet with subject column added to it:
summaryTbl <- bind_cols(subject, selectSet) %>%
      group_by(activityLabel, activityName, subject) %>% 
      summarise_each(funs(mean), -subject, -activityLabel, -activityName)


# Finally, export the table.

write.table(summaryTbl, file = "summaryTbl.txt", row.names = FALSE)
      
      
