#设置工作路径#
setwd("D:/Users/Desktop/running data")

#安装包#
install.packages("randomForest")
install.packages("ggplot2")
install.packages("pacman")

#导入包#
library(randomForest)
library(ggplot2)
pacman::p_load(randomForest,caret,pROC)

#导入160个点的文件路径#
Points<-read.csv("D:/Users/Desktop/running data/points.csv",header=TRUE,sep=",")

#设置随机数#
set.seed(721)

#随机抽取区分训练点与验证点#
index <-  sort(sample(nrow(Points), nrow(Points)*.8))

#命名训练点#
train <- Points[index,]

#命名验证点#
test <- Points[-index,]

#保存训练点#
write.csv(train,"D:/Users/Desktop/running data/train.csv",row.names=FALSE )

#保存验证点#
write.csv(test,"D:/Users/Desktop/running data/test.csv",row.names=FALSE)

#寻找最优mtry#
n<-14
rate=1
for(i in 1:(n-1)){
  set.seed(9251)
  rf.train<-randomForest(BD~Altitude+Aspect+Surface_cur+Slope+Section_cur+TWI +FVC+NDVI+sand+silt+clay+SOC+TN+NDVI,data=train,mtry=i,ntree=1000)
  rate[i]<-mean(rf.train$err.rate) 
  print(rf.train)  }

#寻找最优ntree#
set.seed(5811)
rf.train<-randomForest(BD~Altitude+Aspect+Surface_cur+Slope+Section_cur+TWI +FVC+sand+silt+clay+SOC+TN+NDVI,data=train,mtry=4,ntree=1000)
rf.train
plot(rf.train)

#因变量重要性排序#
round(importance(rf.train),2)
varImpPlot(rf.train)

#交叉验证#
points=na.omit(points)
# 交叉验证中添加随机数的训练集、分组、交叉验证的次数
mypoints=cbind(points[1:6],matrix(runif(96*nrow(points)),nrow(points),96))
# 绘制错误率曲线，观察错误率与使用Markers数量的变化result=rfcv(mypoints,points$BD,cv.fold = 5)
with(result,plot(n.var,error.cv,log="x",type="o",lwd=2))

#多次交叉验证#
result=replicate(5,rfcv(mypoints, points$BD),simplify = FALSE)
error.cv=sapply(result,"[[","error.cv")
matplot(result[[1]]$n.var,cbind(rowMeans(error.cv),error.cv),type = "l",lwd = c(2,rep(1,ncol(error.cv))),col = 1,lty = 1,log="x",xlab = "Number of variables",ylab="CV Error")


