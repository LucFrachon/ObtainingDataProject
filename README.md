# run_analysis.R

This file is the required script for Coursera's Obtaining Data course, which is part of the Data Science specialisation.

## 1. Initial set up
**Packages:**
This code uses the following packages: dplyr, data.table. If you have not installed them, please do so now with install.packages(). They are then loaded automatically by the script.

**Data files:**
The code assumes that you have retained the folder structure of the downloaded data file, and that all the data is stored in a subdirectory of your working directory. By default, the code is written to use the folllowing structure:

    ~/UCI HAR Dataset
    ~/UCI HAR Dataset/train
    ~/UCI HAR Dataset/test

This is basically the structure that you get if you just unzip the downloaded file into your working directory. Just make sure that the said working directory is configured consistently with the set up described above.
If you want to change this, the character strings assigned to variables `dir1`, `dir2` and `mainDir` can be modified in the code.

## 2. Progamming notes
The code is described in more detail in the code book that you will find in the same repo.

* I did not follow exactly the order described in the project brief (steps 1 through 5). I found it much easier to implement column names early on to be able to use them in my code, especially when it came to subsetting only the columns means and standard deviations (step 2). Having column (variable) names allowed me to select them based on character strings contained by those names.
* The data's untidiness included several columns carrying the same names. I wrote a function to rename duplicates, which uses an algorithm that I found on StackOverflow and is less expensive than nested for loops. There was probably a way to tidy up the data more efficiently, possibly using some tidyr functions, but I did not find it.
* I tried to use dplyr's chaining where I could, however in some instances I needed to insert an object in two different places within a function, and could not find an easy way to do this with chaining. If someone could point me in the right direction I would be most grateful!

I look forward to your feedback and to reading what solutions others came up with to solve this project. 
