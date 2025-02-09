nfl_speed <- read.csv("~/Downloads/nfl_speed.csv")

nfl_copy <- nfl_speed

str(nfl_speed)

summary(nfl_speed)

nfl_copy <- nfl_copy[, c("firstName", "lastName", 
                         "position", "teamAbbr", 
                         "week", "yards","inPlayDist", 
                         "maxSpeed")]
# Subsetting takes the rows and columns to make the data smaller 

summary(nfl_copy)

faster_players <- nfl_copy[nfl_copy$maxSpeed > mean(nfl_copy$maxSpeed), ]

mean(faster_players$maxSpeed[faster_players$position == "WR"])

library(ggplot2)

ggplot(data = nfl_copy, 
       mapping = aes(x = yards, y = maxSpeed)) + 
  geom_point() + 
  geom_smooth(method = "lm") + 
  theme_minimal()

save(faster_players, nfl_copy, file = "nfl_subset.RData")

load("nfl_subset.RData")


shots <- read.csv("~/Downloads/bron_steph.csv")

View(shots)

colnames(shots)

shots_copy <- shots

shots_copy <- shots_copy[, c("shooter", "distance", "result", "distance",
                             "result", "assist", "x", "y", "team")]

View(shots_copy)
summary(shots_copy)

head(shots_copy)

bron_shots <- shots_copy[shots_copy$shooter == "LeBron James", ]
curry_shots <- shots_copy[shots_copy$shooter == "Stephen Curry", ]

View(bron_shots)
View(curry_shots)

shots_made <- shots_copy[shots_copy$result == "made", ]
View(shots_made)
shots_miss <- shots_copy[shots_copy$result == "missed", ]
View(shots_miss)

ggplot(data = shots_copy, mapping = aes(x = x, y = y)) + 
  geom_point(data = bron_shots, colour = 'red') +
  geom_point(data = curry_shots, colour = 'blue') + theme_minimal()

length

bron_total <- nrow(bron_shots)
bron_total
bron_made <- length(which(bron_shots$result == "made"))
bron_made

v <- c(10, 20, 30)
names(v) <- c("Moe", "Larry", "Curly")
v



