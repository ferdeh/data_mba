# Nama dokument : Basic R.R
# Penulis       : Ferdiansyah
# Deskripsi     : Latihan Dasar-Dasar R
print ('Soal No 1')
v_hobi_saya <- c("nonton film","makan","jalan-jalan" )
print(v_hobi_saya)

print ('Soal No 2')
matrix_ganjil_saya <- matrix(seq(1,11,2),2,3)
print(matrix_ganjil_saya)

print ('Soal No 3')
makanan <- c('Pizza', 'Bakso', 'Roti', 'Mie Instan')
harga<- c (100000,25000,10000,3000)
df_harga_makanan <- data.frame (makanan,harga)
print (df_harga_makanan)

print ('Soal No 4')
list_saya <- list(v_hobi_saya,matrix_ganjil_saya,df_harga_makanan)
print(list_saya)

