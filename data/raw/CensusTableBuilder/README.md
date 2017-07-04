# ABS Census TableBuilder data

All the `.csv` files in this folder were downloaded from the Australian Bureau of Statistics (ABS) Census TableBuilder interface. The filenames are coded left-to-right as:

- `2011_INGP+LANP1.csv`
- `2016_INGP+LANP4-AustralianIndigenousLanguages.csv`
- or, more generally as:
    `$census_$variable(-$filter)+$variable(-$filter) ... .csv`

where:

- `$census` codes the year of the census, e.g. 2011 or 2016.
- `$variable` codes the ABS variable name, such as LANP (language other than English, spoken at home). These names can be found in the relevant census dictionaries: [2011](http://www.abs.gov.au/ausstats/abs@.nsf/Previousproducts/2901.0Main%20Features702011?opendocument&tabname=Summary&prodno=2901.0&issue=2011&num=&view=) and [2016](http://www.abs.gov.au/ausstats/abs@.nsf/Latestproducts/2901.0Main%20Features702016?opendocument&tabname=Summary&prodno=2901.0&issue=2016&num=&view=). Note that variables are separated by `+` delimiters.
- `-$filter` codes the selected value(s) of a given variable where not all the available options were selected from the Census TableBuilder. For example, `LANP4-AustralianIndigenousLanguages` indicates the `Australian Indigenous Languages` filter on the `LANP4` variable. Note that filters are given in CamelCase without spaces, and thus differ slightly from the ABS Census TableBuilder names.

