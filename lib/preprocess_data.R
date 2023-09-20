library(tm)

preprocess_dataframe <- function(df) {
    corpus <- Corpus(VectorSource(df$cleaned_hm))
    corpus <- tm_map(corpus, content_transformer(tolower))
    corpus <- tm_map(corpus, removePunctuation)
    corpus <- tm_map(corpus, removeNumbers)
    corpus <- tm_map(corpus, removeWords, stopwords("english"))
    corpus <- tm_map(corpus, removeWords, c(
        "happy", "got", "made", "went", "ago", "yesterday", # nolint
        "lot", "today", "months", "month", # nolint
        "happier", "happiest", "last", "week", "past"
    )) # nolint
    return(corpus)
}