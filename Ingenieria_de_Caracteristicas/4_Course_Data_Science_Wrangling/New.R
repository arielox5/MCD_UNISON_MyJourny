not_inches <- function(x, smallest = 50, tallest = 84) {
  inches <- suppressWarnings(as.numeric(x))
  ind <- is.na(inches) | inches < smallest | inches > tallest 
  ind
}

not_inches(c(70))
library(tidyverse)
animals <- c("cat", "puppy", "Moose", "MONKEY")
pattern <- "[a-z]"
str_detect(animals, pattern)
# Q6
animals <- c("cat", "puppy", "Moose", "MONKEY")
pattern <- "[A-Z]$"
str_detect(animals, pattern)
# Q 7
animals <- c("cat", "puppy", "Moose", "MONKEY")
pattern <- "[a-z]{4,5}"
str_detect(animals, pattern)

# Q8
animals <- c("moose", "monkey", "meerkat", "mountain lion")
pattern <- "mo+"
str_detect(animals, pattern)

library(rvest)
library(tidyverse)
library(stringr)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[6]] %>% html_table(fill = TRUE)
colnames(polls) <- c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")

library(dslabs)
fn <- system.file("extdata", "RD-Mortality-Report_2015-18-180531.pdf", package="dslabs")
system2("open", args = fn)
system("cmd.exe", input = paste("start", fn))


# gutenberg
library(tidyverse)
library(gutenbergr)
library(tidytext)
options(digits = 3)

gutenberg_metadata
res <- str_detect(gutenberg_metadata, "Pride and Prejudice")

d3 <- gutenberg_metadata
res <- str_detect(d3[,2], "Pride and Prejudice")
vector <- d3[,2]
vector <- toupper(vector)
vector
res <- str_detect(toupper(gutenberg_metadata), toupper("Pride and Prejudice"), negate = TRUE)
res

library(pdftools)
pdftools::pdf_text(pdf = "http://arxiv.org/pdf/1403.2805.pdf")

test <- pdftools::pdf_text(pdf = "https://contraloria.unison.mx/wp-content/uploads/2015/04/2015-I-1111-JUNTA-UNIVERSITARIA.pdf")
test
