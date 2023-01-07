# install necessary libraries
install.packages("httr")
install.packages("jsonlite")

# load libraries
library(httr)
library(jsonlite)

# set API key and secret
api_key <- "YOUR_API_KEY"
api_secret <- "YOUR_API_SECRET"

# set Upwork API endpoint
api_endpoint <- "https://www.upwork.com/api/v3/jobs/search.json"

# set API parameters
params <- list(
  client_key = api_key,
  client_secret = api_secret,
  q = "data science" # query for jobs related to data science
)

# send API request and store response
response <- httr::GET(api_endpoint, query = params)

# parse JSON response
jobs <- jsonlite::fromJSON(httr::content(response, "text", encoding = "UTF-8"))

# extract list of jobs from response
jobs_list <- jobs$jobs

# print list of jobs
print(jobs_list)
