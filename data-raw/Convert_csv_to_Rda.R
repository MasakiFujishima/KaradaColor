# Generate internal color palettes data `data/KG_palettes.rda`
#
# - R Packages - Internal data.
library("readr")

#Read csv file
ReadData <- read_csv("./data-raw/KG_palettes.csv")

#Convert data.frame to list
df_KG_palettes = list()
for(i in 1:nrow(ReadData)) {
  df_KG_palettes[[i]] <- as.character(ReadData[i, 2:6])
}
names(df_KG_palettes) <- ReadData[[1]]

#Save as Rda file
save(df_KG_palettes, file = "./data/df_KG_palettes.rda")
