#get UI and Server source files
source("global.R")
source("ui/page_plot.R")
source("ui/page_filtered.R")
source("ui/page_alarms.R")
source("server/server_plots.R")
source("server/server_filtered.R")
source("server/server_alarms.R")




ui <- page_navbar(
  theme = bs_theme(5, "minty"),
  navbar_options = list(class = "bg-primary", theme = "dark"),
  title = "Mango Supply Chain Shiny App",
  sidebar = sidebar(
    h5("Data Filtering Options"),
    varSelectInput(
      "color_by",
      "Color by",
      penguins[c("species", "island", "sex")],
      selected = "species"
    )
  ),
  nav_spacer(),
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