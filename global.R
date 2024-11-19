# Contains common import statements and functions

library(shiny)
library(shinydashboard)
library(DT)

df_studydata = read.csv('./www/study_data_filtered.tsv', sep = '\t', check.names = F)

df_studymeta = read.csv('./www/study_metadata.csv', check.names = F)

df_columnmeta = read.csv('./www/column_metadata.csv', check.names = F)

df_studydata = df_studydata[order(df_studydata$`Hit Cancer Assoc Cell Type`, df_studydata$`Hit Any Cell Type`), ]
rownames(df_studydata) = NULL





