# Title   : EDA - IBM HR Attrition
# Author  : Dede Rizky
# Project : HR Analytics - Employee Attrition & Performance
# Input   : IBM_HR_Attrition_Cleaned.rds



library(ggplot2)
library(corrplot)


# 1. Import  Data
DataHRClean <- readRDS("IBM_HR_Attrition_Cleaned.rds")

# 1.1 Data Inspection
dim(DataHRClean)
str(DataHRClean)
summary(DataHRClean)

# 2. Descriptive Statistics

# 2.1 Categorical Variables - Frequency Distribution
JenisData <- sapply(DataHRClean, is.factor)
VariabelKategori <- names(DataHRClean)[JenisData]
VarKategoriFrek <- lapply(DataHRClean[VariabelKategori], table)

# 2.2 Numerical Variables — Descriptive Statistics
Numerik <- sapply(DataHRClean, is.numeric)
VariabelNumerik <- names(DataHRClean)[Numerik]
DataNumerik <- DataHRClean[VariabelNumerik]
summary(DataNumerik)

# 3. Categorical Variables vs Attrition

# 3.1 Attrition Distribution
FrekuensiAttrition <- table(DataHRClean$Attrition)
PersentaseAttrition <- round(prop.table(FrekuensiAttrition) * 100, 1)
BarAttrition <- ggplot(DataHRClean, aes(x = Attrition)) + geom_bar() + 
                labs(title = "Employee Attrition Distribution", x = "Attrition", y = "Number of Employees")

# 3.2 Attrition Rate by Category
# Tujuan: membandingkan proporsi karyawan yang resign berdasarkan kategori setiap variabel.

# 3.2.1 OverTime vs Attrition
Bar_OverTime_Attrition <- ggplot(DataHRClean, aes(x = OverTime, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Lembur",
       x = "OverTime",
       y = "Proporsi")

table(DataHRClean$OverTime, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$OverTime, DataHRClean$Attrition),
                 margin = 1) * 100, 1)

# 3.2.2 Department vs Attrition
Bar_Dept_Attrition <- ggplot(DataHRClean, aes(x = Department, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Department",
       x = "Department",
       y = "Proporsi")

table(DataHRClean$Department, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$Department, DataHRClean$Attrition),
                 margin = 1) * 100, 1)

# 3.2.3 Job Satisfaction vs Attrition
Bar_JobSatis_Attrition <- ggplot(DataHRClean, aes(x = JobSatisfaction, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Job Satisfaction",
       x = "Job Satisfaction",
       y = "Proporsi")

table(DataHRClean$JobSatisfaction, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$JobSatisfaction, DataHRClean$Attrition),
                 margin = 1) * 100, 1)

# 3.2.4 Gender vs Attrition
Bar_Gender_Attrition <- ggplot(DataHRClean, aes(x = Gender, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Gender",
       x = "Gender",
       y = "Proporsi")

table(DataHRClean$Gender, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$Gender, DataHRClean$Attrition),
                 margin = 1) * 100, 1)


# 3.2.5 Marital Status vs Attrition
Bar_MarStatus_Attrition <- ggplot(DataHRClean, aes(x = MaritalStatus, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Marital Status",
       x = "Marital Status",
       y = "Proporsi")

table(DataHRClean$MaritalStatus, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$MaritalStatus, DataHRClean$Attrition),
                 margin = 1) * 100, 1)

# 3.2.6 Job Role vs Attrition
Bar_JobRole_Attrition <- ggplot(DataHRClean, aes(x = JobRole, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Job Role",
       x = "Job Role",
       y = "Proporsi")

table(DataHRClean$JobRole, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$JobRole, DataHRClean$Attrition),
                 margin = 1) * 100, 1)


# 3.2.7 Business Travel vs Attrition
Bar_BusinessTravel_Attrition <- ggplot(DataHRClean, aes(x = BusinessTravel, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Business Travel",
       x = "Business Travel",
       y = "Proporsi")

table(DataHRClean$BusinessTravel, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$BusinessTravel, DataHRClean$Attrition),
                 margin = 1) * 100, 1)


# 3.2.8 Environment Satisfaction vs Attrition
Bar_EnviSatis_Att <- ggplot(DataHRClean, aes(x = EnvironmentSatisfaction, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Environment Satisfaction",
       x = "Environment Satisfaction",
       y = "Proporsi")

table(DataHRClean$EnvironmentSatisfaction, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$EnvironmentSatisfaction, DataHRClean$Attrition),
                 margin = 1) * 100, 1)

# 3.2.9 Job Involvement vs Attrition
Bar_JobInvol_Att <- ggplot(DataHRClean, aes(x = JobInvolvement, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Job Involvement",
       x = "Job Involvement",
       y = "Proporsi")

table(DataHRClean$JobInvolvement, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$JobInvolvement, DataHRClean$Attrition),
                 margin = 1) * 100, 1)

# 3.2.10 Work Life Balance vs Attrition
Bar_WorkLifeBalance_Attrition <- ggplot(DataHRClean, aes(x = WorkLifeBalance, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Work Life Balance",
       x = "Work Life Balance",
       y = "Proporsi")

table(DataHRClean$WorkLifeBalance, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$WorkLifeBalance, DataHRClean$Attrition),
                 margin = 1) * 100, 1)


# 3.2.11 Relationship Satisfaction vs Attrition
Bar_RelationshipSatis_Attrition <- ggplot(DataHRClean, aes(x = RelationshipSatisfaction, fill = Attrition)) +
  geom_bar(position = "fill") +
  labs(title = "Proporsi Attrition berdasarkan Relationship Satisfaction",
       x = "Relationship Satisfaction",
       y = "Proporsi")

table(DataHRClean$RelationshipSatisfaction, DataHRClean$Attrition)
round(prop.table(table(DataHRClean$RelationshipSatisfaction, DataHRClean$Attrition),
                 margin = 1) * 100, 1)


# 4. Numerical Variables vs Attrition
#Tujuan: melihat apakah karyawan yang resign (Yes) punya angka (numerik) yang berbeda 
#dari yang bertahan (No), misalnya apakah gajinya lebih rendah atau usianya lebih muda.

# 4.1 Comparison of Numerical Variables
aggregate(cbind(Age, MonthlyIncome, TotalWorkingYears, YearsAtCompany,
                YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager,
                DistanceFromHome, NumCompaniesWorked) ~ Attrition,
          data = DataHRClean, FUN = median)

# 4.2 Boxplot by Attrition

# 4.2.1 Age
Box_Age_Attrition <- ggplot(DataHRClean, aes(x = Attrition, y = Age)) +
  geom_boxplot() +
  labs(title = "Age Distribution by Attrition",
       x = "Attrition",
       y = "Age")

# 4.2.2 Monthly Income
Box_MonthlyIncome_Attrition <- ggplot(DataHRClean, aes(x = Attrition, y = MonthlyIncome)) +
  geom_boxplot() +
  labs(title = "Monthly Income Distribution by Attrition",
       x = "Attrition",
       y = "Monthly Income")

# 4.2.3 Total Working Years
Box_TotalWorkingYears_Attrition <- ggplot(DataHRClean, aes(x = Attrition, y = TotalWorkingYears)) +
  geom_boxplot() +
  labs(title = "Total Working Years Distribution by Attrition",
       x = "Attrition",
       y = "Total Working Years")

# 4.2.4 Years at Company
Box_YearsAtCompany_Attrition <- ggplot(DataHRClean, aes(x = Attrition, y = YearsAtCompany)) +
  geom_boxplot() +
  labs(title = "Years at Company Distribution by Attrition",
       x = "Attrition",
       y = "Years at Company")

# 4.2.5 Years in Current Role
Box_YearsInCurrentRole_Attrition <- ggplot(DataHRClean, aes(x = Attrition, y = YearsInCurrentRole)) +
  geom_boxplot() +
  labs(title = "Years in Current Role Distribution by Attrition",
       x = "Attrition",
       y = "Years in Current Role")

# 4.2.6 Years Since Last Promotion
Box_YearsSinceLastPromotion_Attrition <- ggplot(DataHRClean, aes(x = Attrition, y = YearsSinceLastPromotion)) +
  geom_boxplot() +
  labs(title = "Years Since Last Promotion Distribution by Attrition",
       x = "Attrition",
       y = "Years Since Last Promotion")

# 4.2.7 Years with Current Manager
Box_YearsWithCurrManager_Attrition <- ggplot(DataHRClean, aes(x = Attrition, y = YearsWithCurrManager)) +
  geom_boxplot() +
  labs(title = "Years with Current Manager Distribution by Attrition",
       x = "Attrition",
       y = "Years with Current Manager")

# 4.2.8 Distance from Home
Box_DistanceFromHome_Attrition <- ggplot(DataHRClean, aes(x = Attrition, y = DistanceFromHome)) +
  geom_boxplot() +
  labs(title = "Distance from Home Distribution by Attrition",
       x = "Attrition",
       y = "Distance from Home")

# 4.2.9 Number of Companies Worked
Box_NumCompaniesWorked_Attrition <- ggplot(DataHRClean, aes(x = Attrition, y = NumCompaniesWorked)) +
  geom_boxplot() +
  labs(title = "Number of Companies Worked Distribution by Attrition",
       x = "Attrition",
       y = "Number of Companies Worked")


# 5. Correlation Analysis

# 5.1 Correlation Matrix
DataNumerik <- DataHRClean[sapply(DataHRClean, is.numeric)]

MatriksKorelasi <- cor(DataNumerik,
                       use = "complete.obs",
                       method = "pearson")
round(MatriksKorelasi, 2)

corrplot(MatriksKorelasi,
         method = "color",
         type = "upper",
         order = "hclust",
         tl.col = "black",
         tl.srt = 45,
         tl.cex = 0.7,
         addCoef.col = "black",
         number.cex = 0.5,
         diag = FALSE)
VarInti <- c("JobLevel", "MonthlyIncome", "TotalWorkingYears", "Age",
             "YearsAtCompany", "YearsInCurrentRole", "YearsWithCurrManager",
             "YearsSinceLastPromotion")
KorelasiInti <- cor(DataHRClean[VarInti], method = "pearson")
corrplot(KorelasiInti, method = "color", type = "upper",
         addCoef.col = "black", number.cex = 0.8,
         tl.col = "black", tl.cex = 0.8, tl.srt = 45)
