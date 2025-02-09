test_mod <- lm(mpg ~ wt, data = mtcars)

test_mod$coefficients

test_mod$fitted.values

load('~/Downloads/arrest_data.RData')

data.frame(
  all_arrests[[1]]$data$Result[[1]]
  )

player_numbers <- sapply(1:length(all_arrests), 
                         function(x) 1:length(all_arrests[[x]]$data$Result))

player_numbers <- unlist(player_numbers)

page_count <- rep (1:55, each = 20)

page_count <- page_count[1:(length(page_count) - 12)]

player_pages <- data.frame(player_numbers, 
                           page_count)

all_arrests <- mapply(FUN = function(player_numbers, page_count) {
  data.frame(all_arrests[[page_count]]$data$Result[[player_numbers]])
}, player_pages$player_numbers, player_pages$page_count, SIMPLIFY = FALSE)

all_arrests <- do.call(rbind, all_arrests)


load('~/Desktop/cfp_rsvp.RData')

data.frame(cfp_rsvp[[1]]$name)

cfp_rsvp[[1]]$eventPerformerExperiences[[1]]



college_name <- sapply(1:length(cfp_rsvp), 
                          function(x) 
                          1:length(cfp_rsvp[[x]]$name))

college_name <- unlist(college_numbers)

page_c <- rep (1:133)

college_pages <- data.frame(college_name,
                           page_c)

name <- mapply(FUN = function(college_name, page_c) {
  data.frame(cfp_rsvp[[page_c]]$name)
}, college_pages$college_name, college_pages$page_c, SIMPLIFY = FALSE)

name <- do.call(rbind, cfp_rsvp)

college_nickname <- sapply(1:length(cfp_rsvp), 
                       function(x) 
                         1:length(cfp_rsvp[[x]]$nickname))

college_nickname <- unlist(college_nickname)

college_pag <- data.frame(college_nickname,
                          page_c)

college_nickname <- mapply(FUN = function(college_nickname, page_c) {
  data.frame(cfp_rsvp[[page_c]]$nickname)
}, college_pag$college_nickname, college_pag$page_c, SIMPLIFY = FALSE)

nickname <- do.call(rbind, college_nickname)

name_nickname <- cbind(college_name, nickname)
              

View(name_nickname)





