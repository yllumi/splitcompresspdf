# SplitCompressPDF

script sederhana untuk memotong dan mengkompress file pdf. Dibutuhkan pdftk dan ghostscript untuk menjalankan script ini

## Cara pakai

- Buat folder misalnya dengan nama sample/
- Simpan file pdf di dalam folder tersebut dan ganti namanya menjadi source.pdf
- Buat file text dengan nama index.txt di dalam folder tersebut
- Isi file index.txt dengan format seperti ini:
  [page-awal] [page-akhir] [nama-file-output.pdf]
  
  contoh:
  ```
  1 5 bab_1.pdf
  6 10 bab_2.pdf
  11 20 bab_3.pdf
  ```
- Jalankan script `./splitcompresspdf.sh namafolder`
