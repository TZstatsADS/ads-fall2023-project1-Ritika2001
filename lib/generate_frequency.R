library(tm)
setwd("./applied_data_science/ads-fall2023-project1-Ritika2001/lib/generate_frequency.R") # nolint: line_length_linter.
source("preprocess_data.R")
generate_word_frequency <- function(df) {
    corpus <- preprocess_dataframe(df) # nolint: object_usage_linter.
    dtm <- TermDocumentMatrix(corpus)
    # Find the most frequent words
    freq_words <- sort(rowSums(as.matrix(dtm)), decreasing = TRUE)
    df2 <- data.frame(word = names(freq_words), freq = freq_words)
    return(df2)
}