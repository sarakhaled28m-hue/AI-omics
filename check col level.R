metadata <- read.csv("C:/Users/sarak/OneDrive/Desktop/Metadata.csv")
View(metadata)

patient_info <- read.csv("C:/Users/sarak/OneDrive/Desktop/patient_info.csv")
View(patient_info)
 write.csv(metadata), "metadata.csv", row.names = FALSE
 
# check cholestrol level (using if)
 cholestrol <- 230
# if statement: check if cholestrol is greater than 240 
 if (cholestrol > 240 ) { 
   print("High cholestrol")
 }
   
# blood pressure 
 systolic_bp <- 110

# if_else statement: check if blood pressure is normal 
 if (systolic_bp < 120) {
   print("Blood pressure is normal")
 }
  
#load patient_info
patient_info <- read.csv(file.choose())

# choose patient_info.csv
str(metadata)

# create copy
meta_copy <- metadata

factor_cols <- c("sample_type", "treatment")

# convert selected columns to factors
for (col in factor_cols) {
 data[[col]] <- ifelse(data[[col]] ==
                       "yes", 1, 0 )

 }
 
 
str(data)
head(head$smoking_status) 
 
 
 