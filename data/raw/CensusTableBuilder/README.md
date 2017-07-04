# ABS Census TableBuilder data

## Licence (accessed 2017-07-04)

All ABS data in this repository were obtained under a Creative Commons Attribution (CC-BY) licence:

> Creative Commons licensing
>
> The Australian Bureau of Statistics (ABS) supplies the bulk of its free and - as of 1 July 2010 - customised data with Creative Commons (CC) Attribution 2.5 Australia licensing. This lessens the restrictions on the use of that data considerably by changing the copyright from 'all rights reserved' to 'some rights reserved'. In effect, what the ABS asks is only that it be acknowledged as the source of the data.
>
> People are free to re-use, build upon and distribute such data, even commercially. This makes a wealth of data more readily available to governments, the community, researchers and businesses, facilitating innovative research and development projects based on quality statistics, and promoting the wider use of statistics in the community, which is one of our core objectives.

from: [Creative Commons licensing | Australian Bureau of Statistics](http://www.abs.gov.au/websitedbs/D3310114.nsf/4a256353001af3ed4b2562bb00121564/8b2bdbc1d45a10b1ca25751d000d9b03)

## Filenaming convention

All the `.csv` files in this folder were downloaded from the Australian Bureau of Statistics (ABS) Census TableBuilder interface. The filenames are coded left-to-right as:

- `2011_INGP+LANP1.csv`
- `2016_INGP+LANP4-AustralianIndigenousLanguages.csv`
- or, more generally as:
    `$census_$variable(-$filter)+$variable(-$filter) ... .csv`

where:

- `$census` codes the year of the census, e.g. 2011 or 2016.
- `$variable` codes the ABS variable name, such as LANP (language other than English, spoken at home). These names can be found in the relevant census dictionaries: [2011](http://www.abs.gov.au/ausstats/abs@.nsf/Previousproducts/2901.0Main%20Features702011?opendocument&tabname=Summary&prodno=2901.0&issue=2011&num=&view=) and [2016](http://www.abs.gov.au/ausstats/abs@.nsf/Latestproducts/2901.0Main%20Features702016?opendocument&tabname=Summary&prodno=2901.0&issue=2016&num=&view=). Note that variables are separated by `+` delimiters.
- `-$filter` codes the selected value(s) of a given variable where not all the available options were selected from the Census TableBuilder. For example, `LANP4-AustralianIndigenousLanguages` indicates the `Australian Indigenous Languages` filter on the `LANP4` variable. Note that filters are given in CamelCase without spaces, and thus differ slightly from the ABS Census TableBuilder names.

