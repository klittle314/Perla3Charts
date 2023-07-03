#function to assemble a data frame using input vectors y1 and y2

make_perla_df <- function(y1,
                          y2, 
                          good_direction = good_direction_up, 
                          epoch_length = 12, 
                          start_date = as.Date("2021-01-01")){
  
  if(good_direction){
    y <- c(y1,y2)
    
    median_y1 <- c(rep(median(y1),epoch_length), rep(NA, epoch_length))
    
    median_y2 <- c(rep(NA, epoch_length), rep(median(y2), epoch_length))
    
  } else {
    y <- c(y2,y1)
    
    median_y1 <- c(rep(median(y2),epoch_length), rep(NA, epoch_length))
    
    median_y2 <- c(rep(NA, epoch_length), rep(median(y1), epoch_length))
  }   
  
  
  epoch <- c(rep_len("Before", length.out = epoch_length), rep_len("After", length.out = epoch_length))
  
  xA <- seq.Date(from = start_date, length.out = 2*epoch_length, by = "month")
  
  df_perla <- cbind.data.frame(Date = xA, y = y,epoch = epoch, 
                               median1 = median_y1,
                               median2 = median_y2)
  
  t_test_out <- t.test(y1, y2, var.equal=TRUE)
  
  list_out <- list(df=df_perla, t_test = t_test_out)
}





#`DM pts seen by Dental`
# this function uses a data frame that has the structure created
# by the function make_perla_df
p_perla <- function(df, 
                    unit,
                    unit_name0 = unit_name,
                    enhanced = TRUE, 
                    measure_label0 = measure_label, 
                    good_direction = good_direction_up,
                    text_y_coord0 = text_y_coord) {
  
  p1 <- ggplot(data = df, aes(x = Date, y = y)) +
    theme_bw()+
    geom_point(size = rel(2.5))+
    geom_line()
  
  if(enhanced) {
    p1 <- p1 + labs(title = paste0(unit_name0, " ", unit,": ", measure_label0),
                    subtitle = "Change in workflow mid-December 2021",
                    caption = "Horizontal lines: 2021 and 2022 monthly medians",
                    y = measure_label0) +
      geom_vline(xintercept = as.Date("2021-12-15"), linetype = "dashed")+
      annotate("text", x = c(as.Date("2021-06-15"),as.Date("2022-06-15")),
               y = text_y_coord0, label = c("Before Change", "After Change"))
    
    p1.1 <- p1 + geom_line(data = df, aes(x = Date, y = median1))
    
    p_out <- p1.1 + geom_line(data = df, aes(x = Date, y = median2)) 
    
    # annotate("segment",x = x_arrow, xend = x_arrow, y = 3, yend = 3.3) +
    if(good_direction) {
      p_out <- p_out + annotate("segment",
                                x = as.Date("2021-03-15"), xend = as.Date("2021-03-15"), y = 75, yend = 85,
                                colour = "blue", arrow = arrow(type = "closed", length = unit(.2, "cm"))) +  
        geom_text(label = "better", x = as.Date("2021-02-01"), y = 80) 
    } else {
      p_out <- p_out + annotate("segment",
                                x = as.Date("2022-03-15"), xend = as.Date("2022-03-15"), y = 85, yend = 75,
                                colour = "blue", arrow = arrow(type = "closed", length = unit(.2, "cm"))) +
        geom_text(label = "better", x = as.Date("2022-02-01"), y = 80)
    }
    
  } else {
    p_out <- p1 + labs(title = paste0(unit_name0, " ", unit,": ", measure_label0), y = measure_label0)
  }
  
  return(p_out)
  
}