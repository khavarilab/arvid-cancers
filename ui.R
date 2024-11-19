# This file defines the dashboard UI for the app

dash <-  dashboardPage(
    dashboardHeader(title = 'ARVID-Cancers'),
    
    # Sidebar content
    dashboardSidebar(
      sidebarMenu(
        menuItem('Cancer Risk SNPs', tabName = 'data', icon = icon('database')),
        menuItem('Metadata', tabName = 'metadata', icon = icon('book-open')),
        menuItem('Additional Info', tabName = 'about', icon = icon('circle-info'))
    )),
    
    # Body content
    dashboardBody(
      tabItems(
        
        tabItem(
          tabName = 'data',
          h3('Cancer Risk CRE Variants'),
          tags$br(),
          fluidRow(
            column(4,
                   selectInput('hitcancer',
                               'Hit in Cancer Associated Cell Type:',
                               c('All',
                                 unique(as.character(df_studydata$`Hit Cancer Assoc Cell Type`))))
            ),
            column(4,
                   selectInput('hittissue',
                               'Hit in Any Cell Type:',
                               c('All',
                                 unique(as.character(df_studydata$`Hit Any Cell Type`))))
            ),
            column(4,
                   selectInput('assoccancer',
                               'Associated Cancer:',
                               c('All',
                                 unique(as.character(df_studydata$`Associated Cancer`))))
            ),
          ),
          # Create a new row for the table.
          dataTableOutput('studydata')
        ),
        
        tabItem(
          tabName = 'metadata',
          tags$div(
            tags$h3('Cancer Risk MPRA Study'),
            tags$p('This study performed massively parallel reporter assays (MPRA) on 4,041 noncoding variants in genomic regions linked to risk for 13 of the most common human cancers in 13 corresponding primary diploid human cell types from tissues where each of these cancers arise.  
                   Tested variants were in linkage disequilibrium (r2 < 0.8) with 985 GWAS lead SNPs implicated in cancer and filtered through DNAse-hypersensitive sites in corresponding tissues.'),
            tags$p('A single-nucleotide resolution compendium of 380 differentially-active SNVs (daSNVs) in regulatory DNA associated with cancer risk was created. 
                   Differential allelic activity in the cell type relevant to the associated cancer is marked, as is differential activity in the other tested cell types. 
                   Putative target genes (ptGenes) determined through proximity, H3K27Ac HiChIP in the corresponding cell type, GTEx in tissues relevant to the associated cancer type and eQLTGen are shown as well.'),
            tags$br(),
            tags$h4('Cancers studied'),    
            tableOutput('studymeta'),
            tags$h4('Data description'),
            tableOutput('columnmeta')
          )
        ),
        
        tabItem(
          tabName = 'about',
          tags$div(
            tags$h3('Additional Information'),
            tags$br(),
            tags$h4('Suggested Citation'),
            tags$p('Kellman, Laura N. et. al. Inherited functional regulatory risk variants for prevalent human cancers.'),
            tags$br(),
            tags$br(),
            tags$h4('Data Download'),
            tags$a(href = 'study_data_download.tsv', 'Download complete MPRA data', download = NA, target = '_blank'),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$br(),
            tags$a(href = 'https://arvid-data.shinyapps.io/home/', 'Back to ARVID Home'),
            tags$br()
          )
        )
        
      )
    )
  )