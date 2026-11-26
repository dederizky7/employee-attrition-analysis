# Title   : Data Cleaning - IBM HR Attrition
# Author  : Dede Rizky
# Project : HR Analytics - Employee Attrition & Performance
# Input   : IBM HR Employee Attrition.csv
# Output  : IBM_HR_Attrition_Cleaned.csv  -> untuk Power BI
#           IBM_HR_Attrition_Cleaned.rds  -> untuk EDA.R

library(dplyr) 
library(skimr)

# 1. Import Data
DataHR <- read.csv("IBM HR Employee Attrition.csv", sep = ";", header = TRUE)

# 1.1 Data Dimensions
dim(DataHR)
str(DataHR)
skim(DataHR) 

# 2. Initial Data Inspection

# 2.1 Duplicate Records
sum(duplicated(DataHR$EmployeeNumber))
sum(duplicated(DataHR))
DataHR[duplicated(DataHR), ]
# Hasil: Nol EmployeeNumber ganda dan nol baris duplikat. Tidak ada tindakan

# 2.2 Missing Value & Blank Row
sum(is.na(DataHR))
colSums(is.na(DataHR))
round(colSums(is.na(DataHR)) / nrow(DataHR) * 100, 2)
sum(rowSums(is.na(DataHR)) == ncol(DataHR)) 
# Hasil: Nol NA di seluruh dataset, nol kolom dan nol baris NA. Tidak ada tindakan

# 2.3 Check blank strings in character variables
sapply(DataHR[sapply(DataHR, is.character)],
       function(x) sum(trimws(x) == "", na.rm = TRUE))
#Hasil: Tidak ditemukan blank strings pada seluruh 9 variabel character. Tidak ada tindakan

# 2.4 Data Inconsistencies

# 2.4.1 Check unique values of character categorical variables
lapply(DataHR[c("Attrition", "BusinessTravel", "Department",
                "EducationField", "Gender", "JobRole",
                "MaritalStatus", "OverTime")], unique)

# 2.4.2 Check frequency distribution of character categorical variables
lapply(DataHR[c("Attrition", "BusinessTravel", "Department",
                "EducationField", "Gender", "JobRole",
                "MaritalStatus", "OverTime")], table)

# 2.4.3 Check unique values of numeric-coded categorical variables
lapply(DataHR[c("Education", "EnvironmentSatisfaction",
                "JobInvolvement", "JobSatisfaction",
                "PerformanceRating", "RelationshipSatisfaction",
                "WorkLifeBalance")], unique)

# 2.4.4 Check frequency distribution of numeric-coded categorical variables
lapply(DataHR[c("Education", "EnvironmentSatisfaction",
                "JobInvolvement", "JobSatisfaction",
                "PerformanceRating", "RelationshipSatisfaction",
                "WorkLifeBalance")], table)
# Hasil: kategori pada 8 kolom teks konsisten (tidak ada penulisan ganda).
# Kode skala sesuai rentang (Education 1-5, lainnya 1-4).
# PerformanceRating hanya berisi nilai 3 dan 4 (Excellent dan Outstanding).
# Tidak ada tindakan

# 2.5 Numerical Data Inspection

# 2.5.1 Descriptive statistics of numerical variables
summary(DataHR[sapply(DataHR, is.numeric)])
# Hasil: rentang nilai wajar (contohnya. Age 18-60, TotalWorkingYears 0-40) dan
# tidak ada nilai negatif. Tidak ada tindakan

# 2.5.2 Check Number of Unique Values
sapply(DataHR, function(x) length(unique(x)))
# Hasil: EmployeeCount, Over18, dan StandardHours hanya memiliki 1 nilai unik
# (tidak informatif), dihapus pada langkah selanjutnya

# 2.5.3 Remove irrelevant variables
DataHR <- DataHR %>% select(-EmployeeCount, -Over18, -StandardHours)
# Alasan : EmployeeCount, Over18, dan StandardHours cuma ada 1 nilai unik sehingga tidak informatif untuk analisis. Dihapus.

# 2.5.4 Check dimensions after removing irrelevant variables
dim(DataHR)
# Hasil : 1470 baris, 32 kolom (sebelumnya ada 35)

# 2.6 Data Type Transformation
DataHR[c("Department", "JobRole", "Gender", "MaritalStatus", "Attrition", 
         "EducationField", "OverTime")] <- lapply(DataHR[c("Department", "JobRole", "Gender", "MaritalStatus", 
                                                           "Attrition", "EducationField", "OverTime")], as.factor)
DataHR$Education <- factor(DataHR$Education, 
                           levels = (1:5), 
                           labels = c("Below College", "College", "Bachelor", "Master", "Doctor"),
                           ordered = TRUE)
DataHR$EnvironmentSatisfaction <- factor(DataHR$EnvironmentSatisfaction,
                                         levels = (1:4), 
                                         labels = c("Low", "Medium", "High", "Very High"),
                                         ordered = TRUE)
DataHR$JobInvolvement <- factor(DataHR$JobInvolvement, 
                                levels = 1:4,
                                labels = c("Low", "Medium", "High", "Very High"),
                                ordered = TRUE)
DataHR$PerformanceRating <- factor(DataHR$PerformanceRating, 
                                   levels = 1:4,
                                   labels = c("Low", "Good", "Excellent", "Outstanding"),
                                   ordered = TRUE)
DataHR$RelationshipSatisfaction <- factor(DataHR$RelationshipSatisfaction, 
                                          levels = 1:4,
                                          labels = c("Low", "Medium", "High", "Very High"),
                                          ordered = TRUE)
DataHR$WorkLifeBalance <- factor(DataHR$WorkLifeBalance,
                                 levels = 1:4,
                                 labels = c("Bad", "Good", "Better", "Best"),
                                 ordered = TRUE)
DataHR$JobSatisfaction <- factor(DataHR$JobSatisfaction,
                                 levels = 1:4,
                                 labels = c("Low", "Medium", "High", "Very High"),
                                 ordered = TRUE)
DataHR$BusinessTravel <- factor(DataHR$BusinessTravel,
                                levels = c("Non-Travel", "Travel_Rarely", "Travel_Frequently"))


# 2.7 Final Data Inspection
str(DataHR)
skim(DataHR)
sum(is.na(DataHR))
# Hasil: Tidak ada NA setelah transformasi

# 2.8 Export Cleaned Data

# 2.8.1 CSV for Power BI
write.csv(DataHR, "IBM_HR_Attrition_Cleaned.csv",
          row.names = FALSE)

# 2.8.2 RDS for further analysis in R
saveRDS(DataHR, "IBM_HR_Attrition_Cleaned.rds")

