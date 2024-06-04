#' Perform a Google Lens search using SerpAPI
#'
#' @param image_url The URL of the image to search
#' @param api_key Your SerpAPI API key
#' @return A list containing the search results
#' @export
#' @examples
#' serpapi_google_lens_search("https://i.imgur.com/HBrB8p0.png", "your_api_key")
serpapi_google_lens_search <- function(image_url, api_key) {
  # Load necessary libraries
  if (!requireNamespace("httr", quietly = TRUE)) {
    stop("Package 'httr' is required but is not installed.")
  }
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    stop("Package 'jsonlite' is required but is not installed.")
  }
  
  library(httr)
  library(jsonlite)
  
  # Construct the API URL
  base_url <- "https://serpapi.com/search"
  
  # Query parameters
  query_params <- list(
    engine = "google_lens",
    url = image_url,
    api_key = api_key
  )
  
  # Make the GET request
  response <- GET(base_url, query = query_params)
  
  # Check the response status
  if (status_code(response) != 200) {
    stop("API request failed with status: ", status_code(response))
  }
  
  # Extract the response content
  content <- content(response, as = "text")
  
  # Convert the JSON content to an R list
  result <- fromJSON(content)
  
  # Save the result to a CSV file
  write.csv(result, file = "output.csv", row.names = FALSE)
  
  return(result)
}
