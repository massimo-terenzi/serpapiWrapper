# serpapiWrapper

A Wrapper for SerpAPI Google Lens Search

## Installation

You can install the package directly from GitHub using `devtools`:
```r
library(devtools)
install_github("massimo-terenzi/serpapiWrapper") 
```

## Usage
```r
library(serpapiWrapper)

#library(httr)
#library(jsonlite)

image_url <- "your_link_here.jpg"
api_key <- "your_api_key_here"

result <- serpapi_google_lens_search(image_url, api_key, hl = "en", country = "us", no_cache = TRUE, async = FALSE, output = "json")
print(result)

write.csv(result, file = "output.csv")
