#get UI and Server source files
source("global.R")
source("ui/page_plot.R")
source("ui/page_filtered.R")
source("ui/page_alarms.R")
source("server/server_plots.R")
source("server/server_filtered.R")
source("server/server_alarms.R")


# ui <- page_sidebar(
#   theme = shinytheme("flatly"),
#   
#   # App title
#   title ="Mango Supply Chain Shiny App",
#   sidebar = sidebar(
#     varSelectInput(
#       "color_by",
#       "Color by",
#       penguins[c("species", "island", "sex")],
#       selected = "species"
#     )
#   ),
#   navset_card_underline(
#     title = "Histograms by species",
#     nav_panel("Bill Length", plotOutput("bill_length")),
#     nav_panel("Bill Depth", plotOutput("bill_depth")),
#     nav_panel("Body Mass", plotOutput("body_mass"))
#   )
#   
#   
# )

ui <- page_navbar(
  title = "Mango Supply Chain Shiny App",
  navbar_options = navbar_options(bg = "#2D89C8" ),
  sidebar = sidebar(
    h5("Data Filtering Options"),  
    varSelectInput(
      "color_by",
      "Color by",
      penguins[c("species", "island", "sex")],
      selected = "species"
    )
  ),
  alarms_panel,
  filtered_panel,
  plot_panel,
  nav_spacer(),
  nav_menu(
    title = "Links",
    align = "right",
    nav_item(tags$a("Posit", href = "https://posit.co")),
    nav_item(tags$a("Shiny", href = "https://shiny.posit.co"))
  )
)

server <- function(input, output, session) {
  plots_server(input, output, session)
  filtered_server(input, output, session)
  alarms_server(input, output, session)
}

shinyApp(ui, server)