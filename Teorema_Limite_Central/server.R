library(shiny)
library(ggplot2)
library(plotly)
library(highcharter)

shinyServer(function(input, output, session) {
    
    # Funcion reactiva que genera 1000 datos aleatorios dependiendo
    # del tipo de distribucion que el usuario escoja como input
    d <- reactive({
        switch (input$dist,
                Normal = rnorm(1000, mean = input$mean, sd = input$sd),
                Uniforme = runif(1000, min = input$dmin, max = input$dmax),
                Exponencial = rexp(1000, rate = input$rate),
                Poisson = rpois(1000, lambda = input$lambda),
                `Chi-cuadrado` = rchisq(1000, df = input$df),
                Beta = rbeta(1000, shape1 = input$shape1, shape2 = input$shape2)
        )
    })
    # Con esta funcion se actualiza el tabpanel del UI
    observeEvent(input$dist, {
        updateTabsetPanel(session, 'params', selected = input$dist)
    })
    
    output$plot <- renderHighchart({
        dist <- input$dist
        hc <- hchart(
            density(d()), 
            type = "area", name = '1000 datos aleatorios'
            ) %>% 
            hc_title(text = paste('Distribución', dist),
                     margin = 20,
                     align = "left",
                     style = list(color = "#22A884", useHTML = TRUE)
            )
        hc
    })
        
    observeEvent(input$muestra, {
        samples1 <- sample(x = d(), 
                           size = input$sample_size)
        output$plot2 <- renderHighchart({
            hchart(
                samples1, 
                color = "#87cefa",
                name = paste(input$sample_size, 'datos')
            ) %>% 
                hc_title(text = 'Histograma de una muestra',
                         margin = 20,
                         align = "left",
                         style = list(color = "#22A884", useHTML = TRUE)
                )
            
        })
        
    })
    
    observeEvent(input$simular, {
        means_samples <- NULL
        for (i in 1:input$n_sims) {
            samples <- sample(x = d(), size = input$sample_size)
            means_samples <- c(means_samples, mean(samples))
        }
        output$sampling_dist <- renderHighchart({
            hchart(
                means_samples,
                color = "orange",
                name = 'Distribución de las medias de muestreo') %>% 
                hc_title(text = 'Distribución de muestreo',
                         margin = 20,
                         align = "left",
                         style = list(color = "#22A884", useHTML = TRUE)
                )
        })
        
    })
    
    output$histograma <- renderPlot({
        p1 <- ggplot(data = data.frame(x = c(-3, 3)), aes(x)) +
            stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1)) + ylab("") +
            scale_y_continuous(breaks = NULL) + theme_minimal()
        p1
    })
    
    
})
