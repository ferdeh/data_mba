batas <- function (){
  cat ('\n')
  print ('############################################################################')
}

nama_tbl <-function(file){
  url_extrak <- strsplit(file,'/')
  nama_table<- url_extrak[[1]][length(url_extrak[[1]])]
  return(nama_table)
}

cektable <- function(file){
  batas()
  df<- read.csv(file, header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "")
  print(paste('Nama Tabel', nama_tbl(file)))
  print (' soal no 01. ukuran table')
  print(paste('banyaknya baris adalah', dim.data.frame(df)[1] ))
  print(paste('banyaknya kolom adalah', dim.data.frame(df)[2] ))
  cat ('\n')
  print (' soal no 02. Nama Kolom')
  print(colnames(df))
  cat ('\n')
  print (' soal no 03. Type data tiap Nama Kolom')
  print (sapply(df, class))
  
  
}

url1 <- 'https://raw.githubusercontent.com/arikunco/machinelearning/master/dataset/HR_comma_sep.csv'
url2 <- 'https://raw.githubusercontent.com/arikunco/machinelearning/master/dataset/house_price_clean.csv'
url3 <- 'https://raw.githubusercontent.com/arikunco/machinelearning/master/dataset/online_retail_clean.csv'

cektable(url1)
cektable(url2)
cektable(url3)
