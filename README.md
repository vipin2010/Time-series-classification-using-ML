# Time-series-classification-using-ML
The objective is to classify time series into stable, linear, and accelerated PS pixels.

This tool uses displacement time series of PS pixels obtained by MT-InSAR processing and extracts 22 time-series features using train_prep.R and test_prep.R for training and testing data, respectively. The time-series features are fed to RF.ipynb and SVM.ipynb for training and testing of the models.

Input: Displacement time-series data (train.csv/test.csv) in the format required by StaMPS_Visualizer  (https://github.com/thho/StaMPS_Visualizer)

Model Training:
train.csv>>train_prep.R>>train_features.csv>>SVM>>trained_SVM
train.csv>>train_prep.R>>train_features.csv>>RF>>trained_RF

Model Testing:
test.csv>>test_prep.R>>test_features.csv>>trained_SVM>>pred_SVM_test
test.csv>>test_prep.R>>test_features.csv>>trained_RF>>pred_RF_test
