library(rvest)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)
nodes <- html_nodes(h, "table")
html_text(nodes[[8]])
html_table(nodes[[8]])

html_table(nodes[[21]])


tab_1 <- html_table(nodes[[10]])
tab_2 <- html_table(nodes[[19]])

tab_1 <- tab_1[,2:ncol(tab_1)]
tab_1 <- tab_1[2:nrow(tab_1),]
tab_2 <- tab_2[2:nrow(tab_2),]

colnames(tab_2) <- c("Team", "Payroll", "Average")

x <- full_join(tab_1, tab_2, by = "Team")

# -------------------------------------------------------
library(tidyverse)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
h2 <- read_html(url)
nodes2 <- html_nodes(h2, "table")
html_text(nodes[[8]])
length(nodes2)

for (n in 1:length(nodes2)){
  print("-----------------------------")
  print(html_table(nodes2[[n]]))
}
  

