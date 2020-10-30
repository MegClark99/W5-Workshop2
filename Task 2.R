#viewing the data first
file <- "http://www.ndbc.noaa.gov/view_text_file.php?filename=44025h2011.txt.gz&dir=data/historical/stdmet/"
readLines(file, n = 4)

#reading in the data without the first 2 rows
buoy <- read_table(file, 
                        col_names = FALSE,
                        skip = 2)
?read_table
?scan



