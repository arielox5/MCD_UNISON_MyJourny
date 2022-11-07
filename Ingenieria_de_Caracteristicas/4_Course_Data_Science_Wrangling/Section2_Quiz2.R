library(dplyr)

c1 <- c("alabama", "alaska", "arizona", "Delaware", "DC")
c2 <- c(1,2,3,4,5)


c3 <- c("alabama", "alaska", "arizona", "California", "Colorado","CN")
c4 <- c(11,12,13,14,15,16)

tab1 <- data.frame(c1,c2)


tab2 <- data.frame(c3,c4)

colnames(tab2) <- c("state", "ele")

tabJoin <- left_join(tab1, tab2, by="satate")
tabJoin <- semi_join(tab1, tab2, by = "satate") 
dat <- left_join(tab1, tab2, by = "state")

c1 <- c("x","a","b")
c2 <- c("y","a","a")

tab1 <- data.frame(c1,c2)

setdiff(tab2,tab1)

library(Lahman)
top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()
People %>% as_tibble()
top_names <- top %>% left_join(People) %>%
  select(playerID, nameFirst, nameLast, HR)

top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names) %>%
  select(nameFirst, nameLast, teamID, HR, salary)

top_p <- AwardsPlayers %>% filter(yearID == 2016)
top_p2 <- AwardsPlayers %>% filter(yearID == 2016) %>% left_join(top_names)
countX <- top_p2 %>% filter(HR > 1)
