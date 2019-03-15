#-------------------------------------------------------------
# script, console, Enviroment, etc
# ctrl + shift + n : 새 스크립트 만들기
# ctrl + Enter : 실행
# 사칙연산자 : +, -, *, /, ^
# 나머지 %%
#-------------------------------------------------------------

# 아래를 코드로 만들어보세요
# 100에 50을 더하세요
# 45에 9를 빼주세요
# 23에 3을 곱해주세요
# 45를 9로 나눠주세요
# 45를 6으로 나눈 나머지는?
# 4의 3제곱은?

#-------------------------------------------------------------
# vector?
#-------------------------------------------------------------

c(2, 4, 6)
x <- c(5, 14, 6, 21, 100, 5, 3, 22) # x라는 변수에 저장


2:6
2:6 + 10:14

c("정보문화학", "중앙일보")

seq(1, 10, by = 0.1)

rep(1:5, times = 5)
rep(1:5, times = 5, each = 10)

# parameter를 모를땐 함수 성격을 검색하는 습관을!
??rep 
help.search("rep")

# 벡터에 적용할 수 있는 함수들 예시 
sort(x)
sort(x, decreasing = T)

rev(x)
table(x)
unique(c(14, 14, 15, 17, 21, 21, 25, 30))

cor(c(1, 2, 3, 4, 5), c(10, 11, 12, 13, 20))

#-------------------------------------------------------------
# vector의 접근
#-------------------------------------------------------------
x[4] #21
x[-4]
x[3:5]
x[-(2:4)]
x[c(1, 5)]

x[x == 100]
x[x < 5]

x[x %in% c(1, 2, 5)]

# 작음따옴표, 큰따옴표?
name <- c("추미애", "김무성", "김진태", "안철수")
name[name == "추미애"]
name[name %in% c("추미애", "안철수", "김성태", "진선미")]


a = a
a == a

5 > 1
3 == 2
3 != 2
3 / 2

#-------------------------------------------------------------
# 데이터타입 (type)
#-------------------------------------------------------------

# 무엇이 무엇이 다를까요?
number1 <- c(1, 2, 3, 4, 5)
number2 <- c("1", "2", "3", "4", "5")

is.numeric(number1)
is.character(number1)
is.factor(number1)
is.logical(number1)

number3 <- as.numeric(number2)
is.character(number2)
is.character(number3)

sum(number1)
mean(number1)
median(number1)
max(number1)
min(number1)
quantile(number1)

round(15.6333)
rank(c(10, 2, 5, 9, 9, 20), ties.method = "min")

var(number1)
sd(number1)


#-------------------------------------------------------------
# 패키지 설치 및 불러오기
#-------------------------------------------------------------
install.packages("tidyverse")
library(tidyverse)
library(readxl)

#-------------------------------------------------------------
# 데이터 가져오기
#-------------------------------------------------------------
sample_xls <- read_xls("data/sample.xls", sheet = 1, col_names = FALSE)
sample_csv <- read_csv("data/sample2.csv")
micro <- read_delim("data/micro_data.txt", delim = ",", col_names = F)


df <- read_csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vQIGRAwCqdHohYKpkHNz10avinrvyoYKe0eSOol5_8wHxJEEfePoSwpyIiiku6JoDWXFQVDtqyMnBk-/pub?gid=0&single=true&output=csv")
df <- read_csv("data/sample1.csv")


#벡터는 여기서 무엇?
df$인상금액 == df[[6]]
sum(df$인상금액 == df[[6]])

is.numeric(df$`2018년_월정수당`)
as.character(df$`2018년_월정수당`)
class(df)


head(df$인상금액)
head(df$인상금액, 20)

tail(df$증가율)
length(df$인상금액)

mean(df$`2018년_월정수당`)
mean(df$`2019년_월정수당`)

mean(df$`2019년_월정수당`) - mean(df$`2018년_월정수당`)

summary(df$`2018년_월정수당`)
summary(df)
class(df$증가율)

# 벡터는 한번에 처리
test <- separate(sample_csv, col = 기간, c("start", "end"), sep = "~")
test2 <- str_replace_all(sample_csv$기간, "\\.", "-")
paste(df$시도, "(광역)")


# 데이터프레임

taltal <- data.frame(
    names = c("배여운", "김원", "심서현"),
    years = c(2, 8, 10),
    gender = c("남", "남", "여")
)

units <- data.frame(
    names = c("조혜경", "하남현"),
    years = c(15, 10),
    gender = c("여", "남")
)

member <- rbind(taltal, units)
glimpse(member)
str(member)
