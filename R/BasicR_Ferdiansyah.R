batas <- function (){
  print ('')
  print ('############################################################################')
}


cektable <- function(file){
  df<- read.csv(file, header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "")
  print (' soal no 01. ukuran table')
  print(paste('banyaknya baris adalah', dim.data.frame(df)[1] ))
  print(paste('banyaknya kolom adalah', dim.data.frame(df)[2] ))
  print (' soal no 02. Nama Kolom')
  print(colnames(df))
  print (' soal no 03. Type data tiap Nama Kolom')
  print (sapply(df, class))
  batas()
  
}

url1 <- 'https://raw.githubusercontent.com/arikunco/machinelearning/master/dataset/HR_comma_sep.csv'
url2 <- 'https://raw.githubusercontent.com/arikunco/machinelearning/master/dataset/house_price_clean.csv'
url3 <- 'https://raw.githubusercontent.com/arikunco/machinelearning/master/dataset/online_retail_clean.csv'

cektable(url1)
cektable(url2)
cektable(url3)
