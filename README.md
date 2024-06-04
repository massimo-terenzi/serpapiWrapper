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

result <- serpapi_google_lens_search("https://i.imgur.com/HBrB8p0.png", "your_api_key")

write.csv(result, file = output.csv)