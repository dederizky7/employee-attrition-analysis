# Employee-attrition-analysis
# Latar Belakang

Tim HR menemukan bahwa sejumlah karyawan meninggalkan perusahaan (*employee attrition*). Kondisi ini perlu diperhatikan karena pergantian karyawan berpotensi menimbulkan beberapa konsekuensi:

- Biaya rekrutmen dan seleksi karyawan baru.
- Biaya pelatihan dan orientasi karyawan.
- Hilangnya pengalaman dan pengetahuan karyawan.
- Gangguan terhadap produktivitas dan operasional tim.
- Beban kerja tambahan bagi karyawan yang masih bertahan.

Proyek ini bertujuan mengidentifikasi kelompok karyawan dengan risiko resign tertinggi agar tim HR dapat mengambil tindakan yang tepat sasaran

# Pertanyaan Bisnis
Pertanyaan utama: Karyawan seperti apa yang paling berisiko meninggalkan perusahaan, dan apa yang dapat dilakukan HR untuk menekannya?

Pertanyaan turunan:

- Seberapa besar tingkat attrition di perusahaan saat ini?
- Kelompok karyawan mana (departemen, peran, profil karyawan) yang paling banyak resign?
- Faktor apa dalam kondisi dan lingkungan kerja yang berkaitan dengan keputusan resign?
- Apakah karyawan yang resign memiliki karakteristik yang berbeda dari yang bertahan?
- Tindakan apa yang dapat diprioritaskan HR berdasarkan temuan tersebut?
# Dataset
- Sumber: IBM HR Analytics Employee Attrition & Performance (Kaggle)
- Jumlah data: 1440 baris, 35 kolom
- Variabel utama: Attrition, OverTime, Department, Job Role, Job Satisfaction, Job Involvement, Environment Satisfaction, Work-Life Balance, Business Travel, Marital Status, Gender, Monthly Income, dan Age

# Tools
- R: dplyr, tidyr, stringr, naniar, skimr, stringdist, ggplot2
- Power BI Desktop

# Data Cleaning (R)
Script: [Data Cleaning.R](Scripts/Data%20Cleaning.R)

Ringkasan pemeriksaan
| Pemeriksaan | Hasil | Tindakan |
|---|---|---|
| Duplikat (baris penuh dan EmployeeNumber) | 0 | Tidak ada |
| Missing value dan baris kosong | 0 | Tidak ada |
| String kosong pada kolom teks | 0 | Tidak ada |
| Inkonsistensi kategori | Tidak ditemukan | Tidak ada |
| Rentang kode skala (1-4 / 1-5) | Sesuai | Tidak ada |
| Nilai numerik | Rentang wajar, tidak ada nilai negatif | Tidak ada |
| Kolom konstan | EmployeeCount, Over18, StandardHours hanya punya satu nilai unik | Dihapus (35 jadi 32 kolom) |

# EDA
Exploratory Data Analysis (EDA) dilakukan untuk memahami karakteristik karyawan dan mengeksplorasi pola yang berkaitan dengan employee attrition

Script:

1. Categorical Variables

Analisis dilakukan dengan membandingkan proporsi karyawan yang resign (Yes) dan bertahan (No) berdasarkan kategori masing-masing variabel.

Temuan Utama
| Variabel | Temuan |
| --- | --- |
| Over Time | Attrition 30,5% pada karyawan (Over time) lembur vs 10,4% yang tidak |
| Departement | Sales memiliki attrition rate tertinggi (20,6%), diikuti Human Resources (19,0%) dan Research & Development (13,8%)  |
| Job Role | Sales Representative memiliki attrition rate tertinggi (39,8%), sedangkan Research Director memiliki attrition rate terendah (2,5%) |
| Business travel | Karyawan yang melakukan perjalanan bisnis Frequently memiliki attrition rate 24,9%, dibandingkan Travel Rarely (15,0%) dan Non-Travel (8,0%) |
| Marital Status | Karyawan Single memiliki attrition rate tertinggi (25,5%), dibandingkan Married (12,5%) dan Divorced (10,1%)|
| Gender | Attrition rate pada laki-laki (17,0%) sedikit lebih tinggi dibandingkan perempuan (14,8%) |
| Job Satisfaction | Karyawan dengan job satisfaction rendah memiliki attrition rate tertinggi (22,8%), sedangkan kategori Very High memiliki attrition rate 11,3% |
| Work Life Balance | Karyawan dengan work-life balance Bad memiliki attrition rate tertinggi (31,2%) |
| Job Involvement | Karyawan dengan job involvement rendah memiliki attrition rate 33,7%, sedangkan kategori Very High sebesar 9,0% |
| Relationship Satisfaction | Karyawan dengan relationship satisfaction rendah memiliki attrition rate 20,7%, lebih tinggi dibandingkan kategori lainnya (14,8-15,5%) |
| Environment Satisfaction | Karyawan dengan environment satisfaction rendah memiliki attrition rate tertinggi (25,4%), dibandingkan kategori Very High (13,5%) |


2. Numerical Variables

Perbandingan karakteristik numerik berdasarkan kelompok Attrition menggunakan median.

Temuan utama

| Variabel | No | Yes |
| --- | --- | --- |
| Age | 36 | 32 |
| Monthly Income | 5204 | 3202 |
| Total Working Years | 10 | 7 |
| Years at Company | 6 | 3 |
| Years in Current Role | 3 | 2 |
| Years since Last Promotion | 1 | 1 |
| Years with Current Manager | 3 | 2 |
| Distance from Home | 7 | 9 |
| Number Companies Worked | 2 | 1 |

3. Correlation Analysis

Analisis korelasi Pearson dilakukan untuk mengeksplorasi hubungan linear antarvariabel numerik

| Kelompok | Pasangan variabel | r (Pearson) | Kekuatan |
| --- | --- | --- | --- |
| Jabatan, pendapatan, dan pengalaman | JobLevel - MonthlyIncome | 0,95 | Sangat kuat |
| Jabatan, pendapatan, dan pengalaman | JobLevel - TotalWorkingYears | 0,78 | Kuat |
| Jabatan, pendapatan, dan pengalaman | MonthlyIncome - TotalWorkingYears | 0,77 | Kuat |
| Masa kerja | YearsAtCompany - YearsWithCurrManager | 0,77 | Kuat |
| Masa kerja | YearsAtCompany - YearsInCurrentRole | 0,76 | Kuat |
| Masa kerja | YearsInCurrentRole - YearsWithCurrManager | 0,71 | Kuat |
