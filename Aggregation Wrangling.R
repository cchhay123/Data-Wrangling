speed <- read.csv("~/Downloads/nfl_speed.csv")

aggregate(maxSpeed ~ position, data = speed, 
          FUN = function(x) c(avg = mean(x), sd = sd(x)))

agg_speed <- aggregate(cbind(maxSpeed, yards) ~ position, 
                       data = speed, FUN = mean)

library(ggplot2)          

ggplot(agg_speed, aes(yards, position, fill = maxSpeed)) +
  geom_col() + theme_minimal()

accident <- read.csv("~/Downloads/Rail_Equipment_Accident_Incident_Data.csv")

colnames(accident)
View(accident)
summary(accident)

accident$Passengers.Transported
accident$Total.Damage.Cost

aggregate(cbind(Passengers.Injured, Railroad.Employees.Injured) ~ Accident.Cause, 
          data = accident, FUN = mean)

accident$Total.Damage.Cost <- as.numeric(gsub(",", "", accident$Total.Damage.Cost))

avg_month <- aggregate(Total.Damage.Cost ~ Accident.Month, data = accident, FUN = mean)

ggplot(avg_month, aes(Accident.Month, Total.Damage.Cost, fill = )) + 
  geom_col() 

avg_year <- aggregate(cbind(Total.Damage.Cost, Passengers.Killed) ~ Report.Year, data = accident, FUN = mean)

ggplot(avg_year, aes(Report.Year, Total.Damage.Cost, fill = Passengers.Killed)) + geom_col()


