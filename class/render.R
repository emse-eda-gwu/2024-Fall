lesson <- strsplit(here::here(), "/")[[1]]
lesson <- lesson[length(lesson)]

# Build the slides
renderthis::to_html("index.Rmd", "index.html")
renderthis::to_pdf("index.html", paste0(lesson, ".pdf"))

# Compress the PDF to reduce size
tools::compactPDF(paste0(lesson, ".pdf"), gs_quality = 'ebook')

files1 <- c( 
  'data',
  'practice-solutions.qmd',
  'practice.qmd',
  'quarto_demo.qmd'
)
files2 <- c(
    'data',
    'practice-solutions.qmd',
    'practice.qmd'
)
files3 <- files2
files4 <- files2
files5 <- files2
files6 <- files2

# Create zip files of class notes
zip::zip(
    zipfile = paste0(lesson, ".zip"),
    files = c(files6, paste0(lesson, ".Rproj"))
)
