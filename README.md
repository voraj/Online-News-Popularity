Online-News-Popularity
===================

Online News Popularity Project for I590
----------

This is a collection of R script files to create model and analyze [Online News Popularity Database](https://archive.ics.uci.edu/ml/datasets/Online+News+Popularity).
We used ONP-transform transformed the dataset to better suite our needs for this project. This can be found here : [ONP-data-transform](https://github.com/asadana/ONP-data-transform)

Need to know things:
-------------
All scripts expect the csv file to be found in resources/ folder in the current directory.
The following libraries need to be installed for the scripts
  1. For DecisionTree.R : "rpart" and "rpart.plot"
  2. For RandomForest.R : "randomForest"
  3. DataPlots.R : none

How to run:
-------------
0. Ensure that the databse is in resources/
1. Set the working directory to the the current working directory
2. Run the desired script
