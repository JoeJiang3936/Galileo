#Galileo falling object model

library(dslabs)
library(broom)


falling_object <- rfalling_object()

fit <- falling_object%>%
  mutate(time_squared = time^2)%>%
  lm(observed_distance~time+time_squared, data = .)

tidy(fit)


augment(fit)%>%ggplot() +
  geom_point(aes(time, observed_distance)) +
  geom_line(aes(time, .fitted))

