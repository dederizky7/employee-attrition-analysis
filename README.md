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
Script: Data Cleaning.R

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
