library(shiny)
library(ggplot2)
library(readr)

server <- function(input, output, session) {
  
  tpm_data <- read_csv("TPMs_table_100genes.csv")
  
  gene_ids <- tpm_data[[1]]
  
  updateSelectInput(session, "gene", choices = gene_ids)
  
  output$tpmPlot <- renderPlot({
    req(input$gene)
    gene_row <- tpm_data[tpm_data[[1]] == input$gene, ]
    df <- data.frame(
      Sample = names(gene_row)[-1],
      TPM = as.numeric(gene_row[,-1])
    )
    ggplot(df, aes(x = Sample, y = TPM)) +
      geom_col(fill = "steelblue") +
      labs(title = paste("TPM Expression for", input$gene),
           x = "Sample", y = "TPM") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
}
