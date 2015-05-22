activity.labels<-read.table("activity_labels.txt", col.names=c("ID","activity"))
features<-read.table("features.txt", col.names=c("ID","feature"))
grep.mean<-grep("mean", features$feature)
grep.std<-grep("std", features$feature)
grep.ms<-sort(c(grep.mean,grep.std))
names.features<-as.character(features$feature[grep.ms])
#---------
subject.test<-read.table("test/subject_test.txt", col.names=c("subject"))
X.test<-read.table("test/X_test.txt")
X.test2<-dplyr::select(X.test, grep.ms)
colnames(X.test2)<-names.features
Y.test<-read.table("test/y_test.txt", col.names=c("y"))
with.action.test<-merge(Y.test, activity.labels, by.x="y", by.y="ID")
all.test<-cbind(subject.test, with.action.test, X.test2)
#-----------------
subject.train<-read.table("train/subject_train.txt", col.names=c("subject"))
X.train<-read.table("train/X_train.txt")
X.train2<-dplyr::select(X.train, grep.ms)
colnames(X.train2)<-names.features
Y.train<-read.table("train/y_train.txt", col.names=c("y"))
with.action.train<-merge(Y.train, activity.labels, by.x="y", by.y="ID")
all.train<-cbind(subject.train, with.action.train, X.train2)
#--------------
all<-rbind(all.test,all.train)
all<-all[,-2]
B<-ddply(all, .(subject, activity), colwise(mean))
write.table(B, file="result.txt", row.name=FALSE) 
