library(tm)
library(wordcloud2)
source("./generate_frequency.R")

generate_wordcloud <- function(df) {
    set.seed(1234) # for reproducibility
    df2 <- generate_word_frequency(df) # nolint: object_usage_linter.
    wordcloud2(data = df2, size = 0.40, color = "random-dark", shape = "circle")
}