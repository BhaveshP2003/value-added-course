library(robotstxt)
library(rvest)
url <- "https://www.icc-cricket.com/rankings/mens/team-rankings/t20i"
path = paths_allowed(url)
#html from website
web = read_html(url)
View(web)
pos <- web %>% html_nodes(".table-body__cell--position")%>% html_text()
View(pos)
Team <- web %>%html_nodes(".rankings-table__team .u-hide-phablet") %>% html_text()
View(Team)
Matches<- web %>%html_nodes(".rankings-table__team+ .table-body__cell") %>% html_text()
View(Matches)
Points<- web %>% html_nodes(".u-center-text+ .table-body__cell.u-center-text") %>% html_text()
View(Points)
Rating<- web %>% html_nodes(".table-body__cell.rating") %>% html_text()
View(Rating)

#creating dataframe
iccranking <- data.frame(pos,Team,Matches,Points,Rating)
View(iccranking)
#save
write.csv(iccranking,"iccranking.csv")