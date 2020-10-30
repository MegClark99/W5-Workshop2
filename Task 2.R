#viewing the data first
file <- "http://www.ndbc.noaa.gov/view_text_file.php?filename=44025h2011.txt.gz&dir=data/historical/stdmet/"
readLines(file, n = 4)

#reading in the data without the first 2 rows
buoy <- read_table(file, 
                        col_names = FALSE,
                        skip = 2)
?read_table
?scan

#extracting vector and removing # sign
vector1 <- scan(file, nlines = 1, what = character()) %>%
  str_remove("#")
vector1
# measurement values (second row) and remove "/"
vector2 <- scan(file, skip = 1, nlines = 1, what = character()) %>%
  str_remove("#") %>%
  str_replace("/", "per")
vector2
#combining 2 vectors into a single vector
?paste
combvector <- paste(vector1, vector2, sep = "_")
combvector
#make combvector the name of all the columns
?names
names(buoy) <- combvector








