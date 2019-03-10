# magical graphics in R by ggplot2
require(ggplot2)
require(ggthemes)
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_histogram(
    fill = "#002B36", 
    alpha = 0.45, 
    position = "identity", 
    bins = 20
  ) + 
  ggthemes::theme_solarized(light = TRUE)


ggplot(
  data = PlantGrowth2, 
  aes(y = weight, x = group, group = group, fill = group
      )
  ) +
  geom_boxplot(
    # fill = "#002B36", 
    alpha = 0.45
  ) + 
  ggthemes::theme_solarized(light = TRUE)  + 
  scale_fill_manual(values = c("#6c71c4", "#d33682", "#b58900")) + 
  guides(fill = FALSE)

ggplot(iris, aes(x = Sepal.Width, y = Petal.Width)) + 
  geom_point(color = "#d33682") +
  geom_smooth(
    method = "loess",  
    linetype = "dashed",
    color = "#6c71c4", 
    fill = "#2aa198"
  ) + 
  ggthemes::theme_solarized(light = FALSE)

ggplot(
  iris, aes(x = Species, y = Sepal.Width, fill = Species)
  ) +
  geom_bar(stat = "identity") + 
  ggthemes::theme_solarized(light = FALSE) + 
  scale_fill_manual(values = c("#6c71c4", "#d33682", "#b58900"))

require(magrittr)
data.frame(
  table(infert$case), 
  Status = c("Normal", "Infertile"),
  percentage = (
    as.data.frame(table(infert$case))$Freq
    )/sum(as.data.frame(table(infert$case))$Freq)
) %>% ggplot(aes(x = "", y = percentage, fill = factor(Status))) + 
  geom_bar(width = 1, stat = "identity") + 
  coord_polar(theta = "y", start = 0) +
  scale_fill_manual(values = c("#6c71c4", "#d33682")) +
  theme(
    axis.text.x = element_blank(), 
    axis.line = element_blank(), 
    plot.title = element_text(hjust = 0.5)
    ) + 
  labs(fill = "Status", 
       x = NULL, 
       y = NULL, 
       title = "Pie Chart of Infertility Status", 
       caption = "Source: infert") +
  geom_text(
    aes(x = 1, y = cumsum(percentage) - percentage/2, 
        label = 
          paste0(round(percentage * 100, digits = 2), "%"))
    )


