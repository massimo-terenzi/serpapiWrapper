#' Perform a Google Lens search using SerpAPI
#'
#' @param image_url The URL of the image to search
#' @param api_key Your SerpAPI API key
#' @param hl Optional. Language code for the search (default is "en").
#' @param country Optional. Country code for the search (default is "us").
#' @param no_cache Optional. Whether to disallow cached results (default is FALSE).
#' @param async Optional. Whether to submit the search asynchronously (default is FALSE).
#' @param output Optional. Output format, either "json" or "html" (default is "json").
#' @return A list containing the search results
#' @export
#' @examples
#' serpapi_google_lens_search("https://i.imgur.com/HBrB8p0.png", "your_api_key", hl = "en", country = "us")
serpapi_google_lens_search <- function(image_url, api_key, hl = "en", country = "us", no_cache = FALSE, async = FALSE, output = "json") {
  # Check and install 'httr' package if not already installed
  if (!requireNamespace("httr", quietly = TRUE)) {
    install.packages("httr")
  }
  # Load 'httr' package
  library(httr)
  
  # Check and install 'jsonlite' package if not already installed
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    install.packages("jsonlite")
  }
  # Load 'jsonlite' package
  library(jsonlite)
  
  # Construct the API URL
  base_url <- "https://serpapi.com/search"
  
  # Query parameters
  query_params <- list(
    engine = "google_lens",
    url = image_url,
    api_key = api_key,
    hl = hl,
    country = country,
    no_cache = ifelse(no_cache, "true", "false"),
    async = ifelse(async, "true", "false"),
    output = output
  )
  
  # Make the GET request
  response <- GET(base_url, query = query_params)
  
  # Check the response status
  if (status_code(response) != 200) {
    stop("API request failed with status: ", status_code(response))
  }
  
  # Extract the response content
  content <- content(response, as = "text")
  
  # Convert the JSON content to an R list if the output is json
  if (output == "json") {
    result <- fromJSON(content)
  } else {
    result <- content
  }
  
  # Save the result to a CSV file if the output is json
  if (output == "json") {
    write.csv(result, file = "output.csv", row.names = FALSE)
  } else {
    write(content, file = "output.html")
  }
  
  return(result)
}
