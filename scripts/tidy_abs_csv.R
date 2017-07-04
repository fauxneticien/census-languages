#!/usr/bin/env Rscript

library(optparse)
library(readr)
library(purrr)
suppressMessages(library(dplyr))
suppressMessages(library(zoo))

# Set up options for command line usage. Get help via Rscript tidy_abs_csv.R --help
opts <- 
   list(
      make_option(opt_str = c("-s", "--start"),
                  type    = "integer",
                  default = 1,
                  help    = "Starting line of CSV data [default = %default]."),
      make_option(opt_str = c("-e", "--end"),
                  type    = "numeric",
                  default = Inf,
                  help    = "Ending line of CSV data [default = %default]."),
      make_option(opt_str = c("-cn", "--colnames"),
                  type    = "character",
                  default = "",
                  help    = "Comma-seperated string of column names [e.g. \"col1,col2,col3\"]."),
      make_option(opt_str = c("-ct", "--coltypes"),
                  type    = "character",
                  default = "",
                  help    = "String of single-letters specifying column types [e.g. \"ccci\"]. See readr::read_delim()."),
      make_option(opt_str = c("-n", "--nalocf"),
                  type    = "character",
                  default = "",
                  help    = "Columns for which NAs should be replaced with last observation using zoo::na.locf()."),
      make_option(opt_str = c("-de", "--dropempty"),
                  type    = "logical",
                  default = TRUE,
                  help    = "Drop empty columns [default = %default].")
      ) %>%
      OptionParser(usage = "Pass in raw CSV data from Australian Bureau of Statistics (ABS) through STDIN, with the following options specified:",
                   option_list = .) %>%
      parse_args()

# Read in raw CSV data
abs_df <-
   read_csv(
      file      = file("stdin"),
      skip      = opts$start - 1,
      n_max     = opts$end   - opts$start,
      col_names = strsplit(opts$colnames, ",") %>% unlist(),
      col_types = opts$coltypes,
      progress  = TRUE
   )

# Drop empty columns.
# ABS CSV data have trailing commas which get interpreted as an empty column on the right side of the table.
if(opts$dropempty) {

   kept_cols <- names(abs_df) %>%
      discard(~ abs_df[.] %>% is.na() %>% all())

   abs_df    <- abs_df[, kept_cols]

}

# ABS CSV data only populates the cells in a column which have distinct values. Empty cells are regarded as having the
# same value as the last populated cell. In R we can carry these populated values forward to all following empty cells
# until the next non-empty cell is encountered. 
if(opts$nalocf != "") {

   locf_cols <- strsplit(opts$nalocf, ",") %>% unlist()

   for(c in locf_cols) {
      abs_df[c] <- na.locf(abs_df[c], na.rm = FALSE)
   }

}

# Output to STDOUT
abs_df %>%
   format_csv() %>%
   cat()
