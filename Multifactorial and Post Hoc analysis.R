### IF LOADING CSV FILES:
### 1) column 1 should be the same for all files (e.g. "id") (and sorted in numerical order for posthoc files)
### 2) replace all commas with semicolons using "replace all"

setwd("whatever folder your files are saved in")

### load postHoc/pairwise comparison files
pairwiseComparison1 = read.table("file1.csv", header=T,sep=",",quote = "",row.names = 1, fill=TRUE,comment.char="")
pairwiseComparison2 = read.table("file2.csv", header=T,sep=",",quote = "",row.names = 1, fill=TRUE,comment.char="")
pairwiseComparison3 = read.table("file3.csv", header=T,sep=",",quote = "",row.names = 1, fill=TRUE,comment.char="")
pairwiseComparison4 = read.table("file4.csv", header=T,sep=",",quote = "",row.names = 1, fill=TRUE,comment.char="")

### load multifactorial files
multifactor.mainEffect1 = read.csv("file5.csv", stringsAsFactors=FALSE)
multifactor.mainEffect2 = read.csv("file6.csv", stringsAsFactors=FALSE)
multifactor.interaction = read.csv("file7.csv", stringsAsFactors=FALSE)

### create data frame with post-hoc 'log2foldchange' and 'adjpval' information uniquely labeled 
postHoc.all = cbind(log2FoldChange.pairwiseComparison1 = pairwiseComparison1$log2FoldChange, padj.pairwiseComparison1 = pairwiseComparison1$padj ...)

### create 3 data frames for each factor including post-hoc information
mainEffect1.postHoc = cbind(multifactor.mainEffect1[order(multifactor.mainEffect1$id),], postHoc.all)
mainEffect2.postHoc = cbind(multifactor.mainEffect2[order(multifactor.mainEffect2$id),], postHoc.all)
interaction.postHoc = cbind(multifactor.interaction[order(multifactor.interaction$id),], postHoc.all)

### write data frames to files
write.csv(mainEffect1.postHoc[order(mainEffect1.postHoc$padj),], file="FILENAMEx.csv")
write.csv(mainEffect2.postHoc[order(mainEffect2.postHoc$padj),], file="FILENAMEy.csv")
write.csv(interaction.postHoc[order(interaction.postHoc$padj),], file="FILENAMEz.csv")