# Employee Attrition Analysis
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
- Jumlah data: 1470 baris, 35 kolom
- Variabel utama: Attrition, OverTime, Department, Job Role, Job Satisfaction, Job Involvement, Environment Satisfaction, Work-Life Balance, Business Travel, Marital Status, Gender, Monthly Income, dan Age

# Tools
- RStudio
- IBM SPSS Statistics
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
| Department | Sales memiliki attrition rate tertinggi (20,6%), diikuti Human Resources (19,0%) dan Research & Development (13,8%)  |
| Job Role | Sales Representative memiliki attrition rate tertinggi (39,8%), sedangkan Research Director memiliki attrition rate terendah (2,5%) |
| Business Travel | Karyawan yang melakukan perjalanan bisnis Frequently memiliki attrition rate 24,9%, dibandingkan Travel Rarely (15,0%) dan Non-Travel (8,0%) |
| Marital Status | Karyawan Single memiliki attrition rate tertinggi (25,5%), dibandingkan Married (12,5%) dan Divorced (10,1%)|
| Gender | Attrition rate pada laki-laki (17,0%) sedikit lebih tinggi dibandingkan perempuan (14,8%) |
| Job Satisfaction | Karyawan dengan job satisfaction rendah memiliki attrition rate tertinggi (22,8%), sedangkan kategori Very High memiliki attrition rate 11,3% |
| Work Life Balance | Karyawan dengan work-life balance Bad memiliki attrition rate tertinggi (31,2%) |
| Job Involvement | Karyawan dengan job involvement rendah memiliki attrition rate 33,7%, sedangkan kategori Very High sebesar 9,0% |
| Relationship Satisfaction | Karyawan dengan relationship satisfaction rendah memiliki attrition rate 20,7%, lebih tinggi dibandingkan kategori lainnya (14,8-15,5%) |
| Environment Satisfaction | Karyawan dengan environment satisfaction rendah memiliki attrition rate tertinggi (25,4%), dibandingkan kategori Very High (13,5%) |

**Ringkasan:** Pola attrition menunjukkan keterkaitan dengan berbagai aspek pekerjaan maupun karakteristik karyawan. Perbedaan yang cukup menonjol terlihat pada variabel terkait tuntutan pekerjaan (OverTime dan Business Travel), serta aspek pengalaman kerja karyawan (Job Satisfaction, Job Involvement, Work Life Balance, dan Environment Satisfaction). Temuan ini mengindikasikan bahwa attrition tidak hanya berkaitan dengan karakteristik demografis, tetapi juga dengan kondisi dan pengalaman karyawan di tempat kerja.

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

**Ringkasan:** Pola perbedaan mengarah pada karyawan yang masih berada di tahap awal karier dan belum lama membangun karir di perusahaan. Hal ini menunjukkan bahwa masa awal bekerja merupakan periode yang perlu mendapat perhatian dalam upaya retensi. Perbedaan ini diuji lebih lanjut pada bagian Statistical Inference.

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

**Ringkasan:** Korelasi menunjukkan adanya keterkaitan yang kuat antara level jabatan, pendapatan, dan pengalaman kerja, serta antara berbagai indikator masa kerja

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

Independent Samples t-Test (Welch) digunakan untuk membandingkan rata-rata variabel numerik antara karyawan yang bertahan (n = 1.233) dan yang resign (n = 237), dengan tingkat signifikansi 5%. Ukuran efek diukur menggunakan Cohen's d.

| Variabel | No, Mean (SE) | Yes, Mean (SE) | t | df | p-value | Cohen's d | Hasil |
|:---|---:|---:|---:|---:|---:|---:|:---|
| Age | 37,56 (0,25) | 33,61 (0,62) | 5,82 | 316,93 | < 0,001 | 0,44 | Signifikan |
| Monthly Income | 6.832,74 (137,21) | 4.787,09 (236,45) | 7,48 | 412,74 | < 0,001 | 0,44 | Signifikan |
| Total Working Years | 11,86 (0,22) | 8,24 (0,46) | 7,02 | 350,88 | < 0,001 | 0,47 | Signifikan |
| Years at Company | 7,37 (0,17) | 5,13 (0,38) | 5,28 | 338,21 | < 0,001 | 0,37 | Signifikan |
| Years in Current Role | 4,48 (0,10) | 2,90 (0,20) | 6,85 | 366,57 | < 0,001 | 0,44 | Signifikan |
| Years since Last Promotion | 2,23 (0,09) | 1,95 (0,20) | 1,29 | 338,49 | 0,199 | 0,09 | Tidak signifikan |
| Years with Current Manager | 4,37 (0,10) | 2,85 (0,20) | 6,63 | 365,10 | < 0,001 | 0,43 | Signifikan |
| Distance from Home | 8,92 (0,22) | 10,63 (0,54) | -2,89 | 322,72 | 0,004 | -0,21 | Signifikan |
| Number Companies Worked | 2,65 (0,07) | 2,94 (0,17) | -1,57 | 317,14 | 0,116 | -0,12 | Tidak signifikan |

# Kesimpulan dan Rekomendasi

**1. Seberapa besar tingkat attrition di perusahaan saat ini?**

Sebanyak 237 dari 1.470 karyawan (16,1%) meninggalkan perusahaan, atau sekitar 1 dari 6 karyawan.

**2. Kelompok karyawan mana yang paling banyak resign?**

- **Job role:** attrition rate tertinggi ada pada Sales Representative (39,8%), diikuti Laboratory Technician (23,9%) dan Human Resources (23,1%).
- **Department:** attrition rate Sales (20,6%) dan Human Resources (19,0%) lebih tinggi daripada Research & Development (13,8%). Namun perbedaannya relatif kecil sehingga sasaran lebih tepat ditentukan berdasarkan job role.
- **Profil karyawan:** attrition rate lebih tinggi pada karyawan yang lembur (over time), berstatus Single (marital status), dan sering melakukan perjalanan bisnis (Travel Frequently). Gender tidak terbukti berkaitan dengan attrition.

**3. Faktor apa dalam kondisi dan lingkungan kerja yang berkaitan dengan keputusan resign?**

- **Over time** merupakan faktor yang paling menonjol: 30,5% pada karyawan yang lembur, dibandingkan 10,4% pada yang tidak.
- **Job involvement, environment satisfaction, dan job satisfaction:** kategori terendah memiliki attrition rate lebih tinggi daripada kategori tertinggi, masing-masing 33,7% vs 9,0%, 25,4% vs 13,5%, dan 22,8% vs 11,3%.
- **Business travel:** 24,9% pada Travel Frequently, dibandingkan 8,0% pada Non-Travel.
- **Work-life balance dan relationship satisfaction:** kategori work-life balance Bad (31,2%) dan relationship satisfaction rendah (20,7%) juga menunjukkan attrition rate lebih tinggi, tetapi belum diuji secara statistik.

**4. Apakah karyawan yang resign memiliki karakteristik yang berbeda dari yang bertahan?**

Karyawan yang resign cenderung berusia lebih muda dan berada pada tahap karier yang lebih awal, dengan monthly income yang lebih rendah, total working years yang lebih sedikit, serta years at company, years in current role, dan years with current manager yang lebih singkat. Mereka juga cenderung tinggal lebih jauh dari kantor (distance from home), meskipun perbedaannya lebih lemah. Sementara itu, years since last promotion dan number companies worked tidak terbukti berbeda. Secara keseluruhan, perbedaan yang ditemukan tergolong kecil, sehingga tidak cukup untuk menentukan secara sendiri siapa yang akan resign.

**5. Tindakan apa yang dapat diprioritaskan HR berdasarkan temuan tersebut?**

| Prioritas | Insight | Rekomendasi | Indikator keberhasilan |
|:---:|:---|:---|:---|
| 1 | Lembur memiliki hubungan terkuat dengan attrition dan dapat dikelola perusahaan | Telusuri unit dan penyebab lembur, lalu evaluasi pembagian beban kerja dan kebutuhan tenaga | Jam lembur dan attrition karyawan lembur |
| 2 | Sales Representative memiliki attrition rate tertinggie | Tinjau target, kompensasi, dukungan atasan, dan jalur karier peran tersebut | Attrition Sales Representative |
| 3 | Karyawan yang keluar cenderung masih di awal karier | Perkuat orientasi, mentoring, dan kejelasan jenjang karier; tinjau daya saing gaji tingkat awal | Attrition pada masa kerja awal |
| 4 | Keterlibatan dan kepuasan rendah disertai attrition lebih tinggi | Lakukan survei berkala dan tindak lanjuti masalah yang ditemukan | Skor keterlibatan dan kepuasan |
| 5 | Perjalanan dinas yang sering berkaitan dengan attrition lebih tinggi | Evaluasi frekuensi dan pemerataan penugasan perjalanan | Attrition pada kelompok Travel Frequently |

## Batasan Analisis
- Hasil menunjukkan hubungan, bukan sebab-akibat.
- Setiap variabel diuji secara terpisah tanpa mengendalikan variabel lain.
- Dataset bersifat fiktif, sehingga temuan merupakan simulasi studi kasus.



