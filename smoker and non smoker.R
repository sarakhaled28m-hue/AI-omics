# create project subfolders
dir.create("raw_data", showWarnings = FALSE)
dir.create("clean_data", showWarnings = FALSE)
dir.create("scripts", showWarnings = FALSE)
dir.create("results", showWarnings = FALSE)
dir.create("plots", showWarnings = FALSE)

# Download " patient_info.csv" from github repo
url <- "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/refs/heads/main/patient_info.csv"

download.file(url, "raw_data/ patient_info.csv", method = "auto")

# load dataset
patient_info <- read.csv("raw_data/ patient_info.csv", stringsAsFactors = FALSE)


# inspect dataset
str(patient_info)
summary(patient_info)
head(patient_info)

# fix data types
factor_cols <- c("gender","smoking_status")

for(col in factor_cols) {
  if(col %in% names(patient_info)) {
    patient_info[[col]] <- as.factor(patient_info[[col]])
  }
}

# create binary smoking status
if ("smoking_status" %in% names(patient_info)) {patient_info$smoking_binary <- ifelse(
  tolower(as.character(patient_info$smoking_status))== "yes", 1L, ifelse(tolower(as,character(patient_info$smoking_status))=="no", 0L,NA_integer_)
 )
}


# save cleaned dataset
write.csv(patient_info, "clean_data/ patient_info_clean.csv",row.names = FALSE)


# plots for smokers vs Non-smokers
library(ggplot2)

# load the cleaned dataset
patient_info <- read.csv("clean_data/patient_info_clean.csv") 


# Bar plot 
ggplot(patient_info, aes(x = factor(smoking_binary), fill= factor(smoking_binary))) + geom_bar()+ scale_fill_manual(values = c("o" = "skyblue", "1" = "yellow"),
                                                                                                                    labels = c("0" = "Non-smokers", "1"= "smokers")) + labs(x = "smoking status", y = "count",
                                                                                                                                                                            title = "Number of smokers vs Non-smokers") + 
  theme_minimal(base_size = 14) 

# boxplot
ggplot(patient_info, aes(x = factor(smoking_binary), fill = factor(smoking_binary))) + ge0m_boxplot() + scale_fill_manual(values = c("0" = "skyblue",,"1" = "yellow"),
                                                                                                                          labels = c("o" = "Non_smokers", "1" = "smokers")) + labs(x = "smoking status", y = "cholestrol level", title = "cholestrol Distribution by smoking status") + theme_minimal(base_size = 14) 
colnames(patient_info)

head(patient_inf0)
barplot(c(5,10), names.arg = c("Non-smoker", "smoker"),col = c("skyblue", "yellow"))

