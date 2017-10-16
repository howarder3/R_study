#############################################################
####  
####   檔案名稱   RLab1.R   (編碼：UTF-8)
####   內容     國際期貨資料  
####   期間     2017.7~2017.9  最後一天因還未收盤所以有缺值
####   包含     黃金  台指期  咖啡  石油  當日收盤價格
####
#############################################################

## 請確定檔案路徑
setwd("d:\\2017FallR")  # 要改檔案位置

## 讀取檔案
Data<-read.csv("RLab1.csv",header = TRUE)

## 01-RBasic-02-Data-Structure-Vectors 練習題

# 國際期貨資料2017年7月間黃金收盤價格
july <- Data[1:21,c("DATE")]
goldjuly <- Data[1:21,c("GOLD")]

# 請同學選出7月(`july`)中，黃金收盤價格超過`1250` 的日期。
july.answer1 <- july[goldjuly > 1250] # 第1題

# 接著請同學計算「7月黃金的平均收盤價格」
goldjuly.mean <- mean(goldjuly) # 第2題

# 請計算「7月黃金的平均收盤價格的標準差」
goldjuly.sd <- sd(goldjuly) # 第3題

# 在統計中，我們常常會計算一筆數據的「標準分數」，也就是將數據減去平均數後除以標準差。
# 請同學計算「7月黃金每日收盤價格的標準分數」
goldjuly.z <- (goldjuly - mean(goldjuly)) / sd(goldjuly) # 第4題


## 01-RBasic-03-Data-Structure-Object 練習題

#' 以下內容改自prcomp 的範例程式碼
#' 
#' PCA(Principle Components Analysis) 是一個資料分析時常用的技術，會在後面的課程中，會進一步的講解它的原理。
#' 在R 中，可以利用prcomp這個指令對GOLD這筆資料進行PCA 的分析，R 則會輸出一個計算後的物件。
goldall <- Data[1:62,c("GOLD")]
pca <- prcomp(goldall, scale = TRUE)

#' 請同學找出PCA的「型態」。你的答案只可能是：「"character"」、「"numeric"」或「"list"」
answer1 <- NULL #第一題，請將NULL替換成你的程式碼
#answer1 <- mode(pca)

#' 請同學將PCA的長度寫入變數answer2。
answer2 <- NULL #第二題，請將NULL替換成你的程式碼
#answer2 <- length(pca)

#' 請同學將PCA的名字寫入變數answer3。
answer3 <- NULL #第三題，請將NULL替換成你的程式碼
#answer3 <- names(pca)

#' PCA的元素中，有一個是各個principal components的standard deviations。
#' 請同學參考help(prcomp)說明中的Value章節。
#' 將各個principal components的standard deviation寫入變數answer4。
answer4 <- NULL #第四題，請將NULL替換成你的程式碼
#answer4 <- pca$sdev

#' PCA 元素中，有一個是PCA的中心(center)。請同學參考help(prcomp)的說明，將該元素寫入變數answer5。
answer5 <- NULL #第五題，請將NULL替換成你的程式碼
#answer5 <- pca$center




## 01-RBasic-05-Arrays-Matrices 練習題
#'已知` A %*% B = C `，給定若`A`是`matrix(3:6, 2, 2)`、`C是c(29, 36)`。 
#'變數`A`和`C`還未存在，請同學先設定變數A、C，
#'第一題:解出`B`並且把它存到變數`B`之中。
#'第二題:利用第一題求得的B，帶入A %*% B = C是否成立
A<-NULL #" A<-matrix(3:6, 2, 2)
C<-NULL #' C<-c(29,36)
B<-NULL #' B<-solve(A,C)   ,B是(3,4)
A %*% B #' 驗算A %*% B = C 是否成立

## 01-RBasic-06-List-DataFrame 練習題
#' 第一題
#' 請問Data中的各行的名稱為何？
listanswer1 <- colnames(Data)

#' 第二題
#' 請問"台指期"這欄的平均值為多少？
listanswer2 <- mean(Data$INDEX)

#' 第三題
#' 請從Data中挑出一些列，滿足以下的條件：
#' 這些列的INDEX值，超過全部Data的INDEX值
#' （`mean(Data$INDEX)`）
#' 你可以先取出INDEX的向量、接著拿該向量和平均值做比較
listanswer3 <- Data[Data$INDEX > listanswer2,]

#' 第四題
#' 請問當INDEX的類別為大於等於10500時，GOLD的平均值為多少？
listanswer4 <- mean(Data[Data$INDEX >= 10500,"GOLD"])