### Random Permutations of Your Data without pipeline
permute_rows <- function(df) df[sample(1:nrow(df)),]
### n-fold Cross-validation without pipeline
group_data <- function(df, n) {
    groups <- rep(1:n, each = nrow(df)/n)
    split(df, groups)
}
### results of crossvalidation without pipeline
df %>% permute_rows %>% group_data(5) %>% head(1)
grouped_df<- df %>% permute_rows %>% group_data(5)
grouped_df[[1]]
grouped_df[[1]] %>%  # the model parameters in the linear model
  lm(y ~ x, data = .) %>%
  .$coefficients

estimates <- grouped_df[[1]] %>%
    lm(y ~ x, data = .)
		%>% .$coefficients

for (i in 2:length(grouped_df)) {
	  group_estimates <- grouped_df[[i]] %>%
	    lm(y ~ x, data = .) %>%
	     .$coefficients
	estimates <- rbind(estimates, group_estimates)
	}
### Machine Learning with pipelines
require(purrr)
estimates <- grouped_df %>%
  map(. %>% lm(y ~ x, data = .) %>% .$coefficients)
estimates <- grouped_df %>%
  map(. %>% lm(dist ~ speed, data = .) %>% .$coefficients) %>%
	do.call("rbind", .)
### Cross-Validation-groups with pipelines
cross_validation_groups <- function(grouped_df) {
  result <- vector(mode = "list", length = length(grouped_df))
  for (i in seq_along(grouped_df)) {
    result[[i]] <- grouped_df[-i] %>% do.call("rbind", .)
  }
  result
}
# example
cars %>%
  permute_rows %>%
  group_data(5) %>%
  cross_validation_groups %>%
  map(. %>% lm(dist ~ speed, data = .) %>% .$coefficients) %>%
do.call("rbind", .)

### cross_validation_split with pipelines
cross_validation_split <- function(grouped_df) {
  result <- vector(mode = "list", length = length(grouped_df))
  for (i in seq_along(grouped_df)) {
    training <- grouped_df[-i] %>% do.call("rbind", .)
    test <- grouped_df[[i]]
    result[[i]] <- list(training = training, test = test)
  }
  result
}
