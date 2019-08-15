#input library data science
library(dplyr)

#input database drilling
df<- read.csv("c:\\tuban\\data_tuban_csv.csv", header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "")

#dimensi df
dim(df)

#metode drilling
levels(df$method)

#filter data to compresor
df_compresor <-filter(df, method == 'Compressor') %>% filter(unit!='Tango')
df_compresor<- mutate(df_compresor,sl_sp=paste(sl,sp))
df_compresor<- mutate(df_compresor,sl_sp_date=paste(sl_sp,date)) %>% mutate(unit_crew = paste(unit,crew))

#select data dan filter
df_compresor_select <- select(df_compresor,sl_sp_date,unit_crew, time) %>% filter(time>0 )
df_compressor_select_sum <- aggregate(df_compresor_select$time, by=list(Category=df_compresor_select$sl_sp_date, df_compresor_select$unit_crew), FUN=sum)
df_compressor_select_sum$Group.2<-as.factor(df_compressor_select_sum$Group.2)
#dimensi data compresor
dim(df_compressor_select_sum)

#rata2 tanpa tanggo
summarise(df_compressor_select_sum,mean = mean(x), sd =sd(x), min=min(x), max(x), n= n())

#histogram all
hist(df_compressor_select_sum$x)

#density plot
d <- density(df_compressor_select_sum$x)
plot(d)

#box plot
boxplot(x~Group.2,data=df_compressor_select_sum,
        main="Different bor capability for each unit",
        xlab="Unit crew",
        ylab="Waktu bor per SP")

#convert to distribusi normal
n<- 1000
sampsize<-6
xbar <- rep(NA,n)

for (i in 1:n){ 
  mysamp <- sample(df_compressor_select_sum$x, size = sampsize)
  xbar[i] <- mean(mysamp)
  }

hist(xbar)

mean(xbar)
sd(xbar)
min(xbar)
max(xbar)

sd_new <- sd(xbar)/sqrt(n)
sd_new

zscore <- (xbar-mean(xbar))/(sd(xbar)/sqrt(length(xbar)))
hist(zscore,breaks= 14)

#data tanggo
#filter data to compresor
df_tanggo <-filter(df, method == 'Compressor') %>% filter(unit=='Tango')
df_tanggo<- mutate(df_tanggo,sl_sp=paste(sl,sp))
df_tanggo<- mutate(df_tanggo,sl_sp_date=paste(sl_sp,date)) 

#select data
df_tanggo_select <- select(df_tanggo,sl_sp_date,unit, time) %>% filter(time>0)
df_tanggo_select_sum <- aggregate(df_tanggo_select$time, by=list(Category=df_tanggo_select$sl_sp_date, df_tanggo_select$unit), FUN=sum)
df_tanggo_select_sum$Group.2<-as.factor(df_tanggo_select_sum$Group.2)
#dimensi data compresor
dim(df_tanggo_select_sum)

#rata2  tanggo
summarise(df_tanggo_select_sum,mean = mean(x), sd =sd(x), min=min(x),max= max(x), n= n())

#z score tanggo
(mean(df_tanggo_select_sum$x)-mean(xbar))/(sd(df_tanggo_select_sum$x)/sqrt(nrow(df_tanggo_select_sum)))

t.test(df_tanggo_select_sum$x, df_compressor_select_sum$x)