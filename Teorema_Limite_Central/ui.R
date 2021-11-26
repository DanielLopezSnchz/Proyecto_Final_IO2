library(shiny)
library(highcharter)
library(shinythemes)
library(png)
library(shinyWidgets)

shinyUI(navbarPage(theme = shinytheme("united"),
                   tags$head(tags$style('p {color:black;}')),
                   setBackgroundColor(
                       color = c("#fafad2"),
                       gradient = "linear",
                       direction = "bottom"
                   ),
    # Sidebar layout with input and output definitions ----
    navbarPage("Teorema de Límite Central",
        tabPanel(title = "Teoría",
                 h2("¿Qué dice el Teorema de Límite Central?"),
                 p("La definición técnica del Teorema de Límite Central es la siguiente:", em("es una teoría estadística que establece que, dada una muestra
                                                                                                  aleatoria suficientemente grande de la población, la distribución de las
                                                                                                  medias muestrales seguirá una distribución normal."), "Esto también implica que
                   mientras más grande es el tamaño de la muestra, la media muestral se acercará más a la media poblacional. Por lo que mediante el TLC podemos definir la distribución de la media
                   muestral de una determinada población siempre y cuando la varianza sea conocida."),
                 mainPanel(width = 6, style = "border-style: solid; border-color: black",
                           plotOutput("histograma", height = "350px", width = "100%")
                 ),
                 h2("Contexto histórico"),
                 p("El TLC es uno de los avances más notorios en la estadística. El desarrollo de este teorema no se le atribuye únicamente a un matemático que haya desarrollado en su totalidad el concepto
                   y condiciones del teorema, sino fueron varios matemáticos que, a lo largo de la historia, lo fueron perfeccionando. Fue establecido por primera vez por el matemático francés Abraham de Moivre, quién
                   lo propuso en 1738. Al pincipio solo podía ser aplicado bajo condiciones muy restringidas, y no fue hasta principios del siglo XIX que el astrónomo, físico y matemático, Pierre-Simon Laplace, lo desarrolló
                   de una manera más general. En 1901 el matemático ruso Aleksandr Lyapunov fue quien lo estableció en condiciones generales, y proporcionó una demostración rigurosa valiendose de herramientas matemáticas más 
                   complejas."),
                 p("El Teorema de Límite Central tuvo origen gracias a la necesidad de hacer cálculos para distribuciones binomiales y otras discretas. A medida que la variable", em("n"), "se iba volviendo cada vez más grande,
                   los cálculos de probabilidad de los valores de la variable se volvían más laboriosos, y sin el poder computacional como el de hoy en día, era necesario crear un método para hacer aproximaciones a estos cálculos complejos
                   de probabilidad.")
        ),
        tabPanel(title = "Simulación", 
                 sidebarPanel(
                     p(style = "color: black","¡Bienvenido al simulador del Teorema de Límite Central!"),
                     p(style = "color: black", "Elige el tipo de distribución que deseas probar, 
                       luego selecciona las características que desees que tenga la distribución. 
                       Para graficar una muestra del conjunto de datos selecciona el tamaño de la muestra y presiona", strong("1 Muestra"),". 
                       Para simular el TLC selecciona el número de iteraciones (simulaciones) que deseas probar. Luego presiona", strong("Simular"),
                       "para ver el histograma de muestreo."),
                     prettyRadioButtons("dist", "Seleccione una distribución",
                                  c("Normal",
                                    "Uniforme",
                                    "Exponencial",
                                    "Poisson",
                                    "Chi-cuadrado",
                                    "Beta"),
                                  icon = icon("check"),
                                  bigger = TRUE,
                                  status = "info",
                                  animation = "jelly"
                            ),
                     tabsetPanel(
                         id='params',
                         type = 'hidden',
                         tabPanel('Normal',
                                  numericInput('mean', 'Media', value = 0),
                                  numericInput('sd', 'St. Dev', value = 1)
                                  ),
                         tabPanel('Uniforme',
                                  numericInput('dmin', 'Mínimo', value = 0),
                                  numericInput('dmax', 'Máximo', value = 1)
                                  ),
                         tabPanel('Exponencial',
                                  numericInput('rate', 'Razón', value = 1, min = 0)
                                  ),
                         tabPanel('Poisson',
                                  numericInput('lambda', 'Lambda', value = 1)
                                  ),
                         tabPanel('Chi-cuadrado',
                                  numericInput('df', 'Grad. de libertad', value = 3)
                                  ),
                         tabPanel('Beta',
                                  numericInput('shape1', 'Alpha', value = 4),
                                  numericInput('shape2', 'Beta', value = 2)
                                  )
                         ),
                     sliderInput("sample_size",
                                 "Tamaño de la muestra",
                                 value = 30,
                                 min = 1,
                                 max = 150
                                 ),
                     numericInput("n_sims",
                                  "Número de simulaciones", 
                                  value = 1000, min = 1),
                     actionBttn("muestra", "1 Muestra",
                                  style = "material-flat",
                                  color = "danger"),
                     actionBttn("simular", "Simular",
                                style = "material-flat",
                                color = "danger")
                     ),
                 
                 mainPanel(
                     
                     # Output: Tabset w/ plot, summary, and table ----
                     br(),
                     tabPanel("Histograma Data", highchartOutput("plot")),
                     tabPanel("Histograma 1 muestra", highchartOutput("plot2")),
                     tabPanel("Histograma de Muestreo", highchartOutput("sampling_dist"))
                 )
                 ),
        tabPanel(title = "¿Cómo se simuló?",
                 h2("Simulación de Monte Carlo para el TLC"),
                 p("Para simular el Teorema de Límite central primero se creó una población de 1000 datos aleatorios, que responden a la probabilidad
                   que se indique en el ", em("sidebar"),". Esa distribución tendrá las características que también se le indique. De esa población, el usuario
                   selecciona el tamaño de la muestra, que puede ir de 1 a 150. Luego se selecciona el número de simulaciones (1000 iteraciones es lo recomendado). El simulador
                   lo que hace es tomar ", em("N"), " muestras del tamaño indicado a la población de 1000 datos, dependiendo del número de simulaciones, y sacarles la media a cada una de esas muestras.
                   Las medias se guardan en un vector que posteriormente se le graficará su distribución. Esta distribución tenderá más a la normalidad mientras el tamaño de la muestra incremente y el número de simulaciones
                   también sea alto (1000 recomendado). Al observar el histograma se puede notar que la media se la distribución tiende a ser la misma que la media de la distribución poblacional, aunque esta no tenga una distribución normal.")
                 )
        
    )
   
))
