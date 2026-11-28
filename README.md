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
- RStudio
- IBM Statistic SPSS
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

# Statistical Inference

Untuk memeriksa apakah perbedaan proporsi resign antar kategori pada tabel categorical variables bukan terjadi hanya karena kebetulan (variasi acak), dilakukan uji chi-square antara setiap variabel dan Attrition. Cramér's V digunakan untuk melihat kekuatan hubungan antar variabel.


| Variabel | χ² (Pearson) | df | p-value | Cramér's V | Hasil |
|:---|---:|---:|---:|---:|:---|
| Over Time | 89,04 | 1 | < 0,001 | 0,246 | Signifikan |
| Job Role | 86,19 | 8 | < 0,001 | 0,242 | Signifikan |
| Marital Status | 46,16 | 2 | < 0,001 | 0,177 | Signifikan |
| Job Involvement | 28,49 | 3 | < 0,001 | 0,139 | Signifikan |
| Business Travel | 24,18 | 2 | < 0,001 | 0,128 | Signifikan |
| Environment Satisfaction | 22,50 | 3 | < 0,001 | 0,124 | Signifikan |
| Job Satisfaction | 17,51 | 3 | 0,001 | 0,109 | Signifikan |
| Department | 10,80 | 2 | 0,005 | 0,086 | Signifikan |
| Gender | 1,27 | 1 | 0,259 | 0,029 | Tidak signifikan |

# Kesimpulan dan Rekomendasi

**1. Seberapa besar tingkat attrition di perusahaan saat ini?**

Sebanyak 237 dari 1.470 karyawan (16,1%) meninggalkan perusahaan, atau sekitar 1 dari 6 karyawan.

**2. Kelompok karyawan mana yang paling banyak resign?**

- **Job Role:** attrition rate tertinggi ada pada Sales Representative (39,8%), diikuti Laboratory Technician (23,9%) dan Human Resources (23,1%).
- **Department:** attrition rate sales (20,6%) dan human resources (19,0%) lebih tinggi daripada research & development (13,8%). Namun perbedaannya relatif kecil sehingga sasaran lebih tepat ditentukan berdasarkan Job Role.
- **Profil karyawan:** attrition rate lebih tinggi pada karyawan dengan over time atau lembur, marital status single, dan sering melakukan perjalanan bisnis (business travel frequently). Gender tidak terbukti berkaitan dengan attrition.

**3. Faktor apa dalam kondisi dan lingkungan kerja yang berkaitan dengan keputusan resign?**

- **Over Time** merupakan faktor yang paling menonjol: 30,5% pada karyawan yang lembur, dibandingkan 10,4% pada yang tidak.
- **Job Involvement, Environment Satisfaction, dan Job Satisfaction:** kategori terendah memiliki attrition rate lebih tinggi daripada kategori tertinggi, masing-masing 33,7% vs 9,0%, 25,4% vs 13,5%, dan 22,8% vs 11,3%.
- **Business Travel:** 24,9% pada Travel Frequently, dibandingkan 8,0% pada Non-Travel.
- **Work-Life Balance dan Relationship Satisfaction:** kategori Work-Life Balance Bad (31,2%) dan Relationship Satisfaction rendah (20,7%) juga menunjukkan attrition rate lebih tinggi.

**4. Apakah karyawan yang resign memiliki karakteristik yang berbeda dari yang bertahan?**

Secara umum, karyawan yang resign cenderung berusia lebih muda dan berada pada tahap karier yang lebih awal, dengan monthly income yang lebih rendah, total working Years yang lebih sedikit, dan years at company yang lebih singkat dibandingkan karyawan yang bertahan. Mereka juga cenderung tinggal lebih jauh dari kantor.


| Prioritas | Insight | Rekomendasi | Indikator keberhasilan |
|:---:|:---|:---|:---|
| 1 | Lembur memiliki hubungan terkuat dengan attrition dan dapat dikelola perusahaan | Telusuri unit dan penyebab lembur, lalu evaluasi pembagian beban kerja dan kebutuhan tenaga | Jam lembur dan attrition karyawan lembur |
| 2 | Risiko sangat terkonsentrasi pada Sales Representative | Tinjau target, kompensasi, dukungan atasan, dan jalur karier peran tersebut | Attrition Sales Representative |
| 3 | Karyawan yang keluar cenderung masih di awal karier | Perkuat orientasi, mentoring, dan kejelasan jenjang karier; tinjau daya saing gaji tingkat awal | Attrition pada masa kerja awal |
| 4 | Keterlibatan dan kepuasan rendah disertai attrition lebih tinggi | Lakukan survei berkala dan tindak lanjuti masalah yang ditemukan | Skor keterlibatan dan kepuasan |
| 5 | Perjalanan dinas yang sering berkaitan dengan attrition lebih tinggi | Evaluasi frekuensi dan pemerataan penugasan perjalanan | Attrition pada kelompok Travel Frequently |
