library(tsfeatures)
#path <- "E:/CoronaQuarantine/PhD Semester IX/Journals and Conferences/ML Paper/processing/Train_Maoxian_RandomTS_negativeOnly.csv"
path <- "E:/CoronaQuarantine/PhD Semester IX/Journals and Conferences/ML Paper/Manuscript/Correction by Ramji Sir/Correction by Tapas Sir/Test_model_consistency/Data_v.csv"
# reading contents of csv file
content <- read.csv(path)
print(content)

myfeatures3 <- tsfeatures(t(content[1:nrow(content),3:ncol(content)-1]))
print(myfeatures3)
labels <- content[1:nrow(content),ncol(content)]
print(labels)


cont <- content[1:nrow(content),3:ncol(content)-1]
stab_cont <- numeric(0)
lump_cont <- numeric(0)
max_level_shift_cont <- numeric(0)
max_var_shift_cont <- numeric(0)
max_kl_shift_cont <- numeric(0)
crossing_points_cont <- numeric(0)
non_linearity_cont <- numeric(0)
var_cont <- numeric(0)
mean_cont <- numeric(0)
for (x in 1:nrow(cont)) {
  
  stab_cont[x] <- stability(as.numeric(t(content[x,1:ncol(cont)])))
  lump_cont[x] <- lumpiness(as.numeric(t(content[x,1:ncol(cont)])))
  max_level_shift_cont[x] <- max_level_shift(as.numeric(t(content[x,1:ncol(cont)])))
  max_var_shift_cont[x] <- max_var_shift(as.numeric(t(content[x,1:ncol(cont)])))
  max_kl_shift_cont[x] <- max_kl_shift(as.numeric(t(content[x,1:ncol(cont)])))
  crossing_points_cont[x] <- crossing_points(as.numeric(t(content[x,1:ncol(cont)])))
  non_linearity_cont[x] <- nonlinearity(as.numeric(t(content[x,1:ncol(cont)])))
  var_cont[x] <- var(as.numeric(t(content[x,1:ncol(cont)])))
  mean_cont[x] <- mean(as.numeric(t(content[x,1:ncol(cont)])))
}
ff <- cbind(myfeatures3[1:nrow(myfeatures3),4:ncol(myfeatures3)],stab_cont, lump_cont, max_level_shift_cont, max_var_shift_cont,max_kl_shift_cont,crossing_points_cont,non_linearity_cont, var_cont, mean_cont,labels)
ff1 <- na.omit(ff)

write.csv(ff1,"E:/CoronaQuarantine/PhD Semester IX/Journals and Conferences/ML Paper/Manuscript/Correction by Ramji Sir/Correction by Tapas Sir/Test_model_consistency/Data_v_features.csv")
