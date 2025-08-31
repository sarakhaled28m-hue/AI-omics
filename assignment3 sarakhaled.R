# Assignment operators

# used to store vaues inside variables 

# <-  (Most common, rightward assignment operator)
height <- c(1.75, 1.76, 1.82, 1.6)

# ->   (same as above, but leftward assignment operator)
c(68, 78, 85, 75) -> weight

# =   (Also assigns, usedin function arguments)
smoking_status = c("Yes", "No", "No", "Yes")

# Arithmetic Operator
# perform basic math i.e:
# + addition
# - subtraction
# * multiplication 
# / division 
# ^ exponent (to the power of)

# let's BMI using weight and height 

BMI <- weight/(height^2)
BMI

# vectorization 
# R perform operation to every value in the vector


# comparison Operators
# comparison operators ask logical questions about values.
# they return output as TRUE or FALSE 
# they don't calculate answer 
they compare values

#  >  greater than
BMI > 25
#  <  less than 
BMI < 18.5 
#  >=  greater than or equal to
#  >=  less than or equal to 
#  ==  equal to
#  !=   not equal to 

# In R
# yes = TRUE
# no = FALSE 

# Logical Operators
# Logical operators let us combine conditions;

#  &  AND   (both must be TRUE)
# Is the patient overweight AND a smoker
# BMI cutoff = 25
(BMI > 25) & (smoking_status == "Yes") 
(BMI < 25) & (smoking_status == "Yes") 

#  |  OR    (at least one must be TRUE)

#  Is the patient is overweight OR a smoker
BMI > 25 | (smoking_status == "Yes")
BMI
smoking_status
#  !  NOT   (reverse the condition)

# Is the patient Not a smoker
!smoking_status == "No"
# condition = yes 
# output = FALSE 



# 2. Data structures in R
# Data structures are how R organizes and stores information.
# Main structures we will use again and again:
#    1. Vectors 
#    2. Lists
#    3. Matrices
#    4. Data Frames 


# Vectors
# simplest data structure in R.
# It stores a sequence of values, but all of the same type.

#  - Numeric vector
num_vec <- c(1, 2, 3,4)
class(num_vec)
# numeric vectors used to perform mathematical calculation 
#  - Character vector
chrc_vector <- c("gene1", "gene2", "gene3")

#  - Logical vector
logical_vector <- c(TRUE, FALSE, TRUE)

mix_vector <- c("gene1", 1, "gene2", 2)
mean(mix_vector)

# we can extract values from vectors using indexing with [].
num_vec[2]
num_vec[2:4]  # this ; indicate sequence 

# you can only combine vectors of equal seuence 
# we can tret vectors as column or as row 
# by column
vec_col <- cbind(num_vec, chrc_vector)

# Lists 
# Unlike vectors, a list can hold multiple types together;
# numbers, text, logical even other data frames.

all_vectors <- list(num_vec, chrc_vector, logical_vector)

# save your raw_data
# save processed data
# results 

# we access elements with [[]]
all_vectors[[2]]

# Matrices 
# A matrix is a 20 structure (rows × columns)
# All values must be the same type (usually numeric).
# Example: gene expression matrix where rows are genes and 
# columns are samples 

my_matrix <- matrix(1:9, nrow = 3, ncol = 3)

# By default R fills the matrix column wise 
# we change using byrow = TRUE

my_matrix <- matrix(1:9, nrow = 3, byrow = TRUE)

# we access elements with [row, column]
my_matrix[2,3]
my_matrix[2,]
my_matrix[# rows, #columns]
  
  
# Data Frames
# A data frame is the most important structure for real datasets 
# Each column can be of a different type: numeric, character, factor
data <- data.frame(
  patient_id = c("p1", "p2","p3"),
  age = c(65, 78, NA),
  diagnosis = c("cancer", "diabetes", "cancer")
)

print(data)

#Dataset Assessment
# functions like str(), head(), dim(), and names() help us explore
# the dataset before analysis.
str(data) #structure of the dataset
head(data) #first 6 rows
head(data), n=2 ) # first
tail(data, n=1) 

dim(data) # rows & columns 
names(data) # column names

# Data frame are indexed like matrix with flexibility 
# access a column directly
data$patient_id
data[c(1,3), c(2,3)]


# Missing values
# Real data is messy. missing values in R written as Na
# we can:
is.na(data)
# - missing  values by column 
colSums(is.na(data))
# count them; sum(is.na())
sum(is.na(data))
# missing values by rows
rowSums(is.na(data))

# remove them: na.omit()
# remove rows with missing values
 clean_data_1 <- na.omit(data)
 clean_data_1

 # remove column with missing value
 clean_data_2 <- data[, colSums(is.na(data))==0]
 
 # replace them: impute with 0 or column mean 
 clean_data_3 <- data
clean_data_3[is.na(clean_data_3)] <- 0
 
 
clean_data_4 <- data
clean_data_4[is.na(clean_data_4)] <- mean(data$age, na.rm = TRUE)
clean_data_4
# 3. function in R
# functions let us wrap code into reusable block of
# structure of a function:
# name 
# calculate_BMI

# arguments (inputs)
function(x) # input argument 
# body (steps/operation)
  (BMI <- weight/height^2)

# return value (output)
return(BMI)

# why use function 
# avoid repetiton 
# organize and simplify code
# reuse across projects
# share with others 

# create a function to calculate BMI
# first argument = weight
# second argument = height
calculate_BMI <- function(weight, height){
  # operation we want to perform
  bmi <- weight/(height^2)
  return(bmi)
}
# call the function 
calculate_BMI(weight = 60, height = 1.75)
calculate_BMI(weight = weight, height = height)

calculate_BMI(60,1.65)

#typical loop workflow
# 1. Define input and output folders
input_dir <- "Raw_Data"
output_dir <- "Results"

# create output folder if not already exsist
if(!dir.exists(output_dir)){
  dir.create(output_dir)
}

# the results folder if we be created if already not exsist

# 2. list which files to process
files_to_process <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")# names of files 

input_file_path <- file.path(input_dir, file_names)

# import dataset
data <- read.csv(input_file_path, header = TRUE)
cat("file imported. checkinh for missing values...\n")



# handling missing values 
if("height" %in% names(data))[
  missing_count <- sum(is.na(data$height))
]

cat("missing values in height':", missing_count,"\n")
data$weight[is.na(data$weight, data$height)]



















  
  
  





 # summary









































