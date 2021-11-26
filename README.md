# Proyecto Final IO II
Proyecto Final de Investigación de Operaciones II UFM 2021

## Introducción
El proyecto consiste en un simulador del Teorema de Límite Central. Decidí hacer estre proyecto porque me he dado cuenta que el TLC es un concepto en estadística cuya lógica no es tan fácil de entender al principio. Es poco intuitivo y de mucha utilidad, específicamente para todo lo que tenga que ver con pruebas de hipótesis para parámetros como la media y desviación estándar. Por medio de una simulación de Monte Carlo simulé las distribuciones muestrales para entender el funcionamiento del teorema.

## Explicación del modelo
### ¿Qué dice el Teorema de Límite Central
La definición técnica del Teorema de Límite Central es la siguiente: es una teoría estadística que establece que, dada una muestra aleatoria suficientemente grande de la población, la distribución de las medias muestrales seguirá una distribución normal. Esto también implica que mientras más grande es el tamaño de la muestra, la media muestral se acercará más a la media poblacional. Por lo que mediante el TLC podemos definir la distribución de la media muestral de una determinada población siempre y cuando la varianza sea conocida.
### Contexto histórico
El TLC es uno de los avances más notorios en la estadística. El desarrollo de este teorema no se le atribuye únicamente a un matemático que haya desarrollado en su totalidad el concepto y condiciones del teorema, sino fueron varios matemáticos que, a lo largo de la historia, lo fueron perfeccionando. Fue establecido por primera vez por el matemático francés Abraham de Moivre, quién lo propuso en 1738. Al pincipio solo podía ser aplicado bajo condiciones muy restringidas, y no fue hasta principios del siglo XIX que el astrónomo, físico y matemático, Pierre-Simon Laplace, lo desarrolló de una manera más general. En 1901 el matemático ruso Aleksandr Lyapunov fue quien lo estableció en condiciones generales, y proporcionó una demostración rigurosa valiendose de herramientas matemáticas más complejas.

El Teorema de Límite Central tuvo origen gracias a la necesidad de hacer cálculos para distribuciones binomiales y otras discretas. A medida que la variable n se iba volviendo cada vez más grande, los cálculos de probabilidad de los valores de la variable se volvían más laboriosos, y sin el poder computacional como el de hoy en día, era necesario crear un método para hacer aproximaciones a estos cálculos complejos de probabilidad.
### ¿Cómo se simuló?
Para simular el Teorema de Límite central primero se creó una población de 1000 datos aleatorios, que responden a la probabilidad que se indique en el sidebar . Esa distribución tendrá las características que también se le indique. De esa población, el usuario selecciona el tamaño de la muestra, que puede ir de 1 a 150. Luego se selecciona el número de simulaciones (1000 iteraciones es lo recomendado). El simulador lo que hace es tomar N muestras del tamaño indicado a la población de 1000 datos, dependiendo del número de simulaciones, y sacarles la media a cada una de esas muestras. Las medias se guardan en un vector que posteriormente se le graficará su distribución. Esta distribución tenderá más a la normalidad mientras el tamaño de la muestra incremente y el número de simulaciones también sea alto (1000 recomendado). Al observar el histograma se puede notar que la media se la distribución tiende a ser la misma que la media de la distribución poblacional, aunque esta no tenga una distribución normal.


## Link al simulador
### **https://daniellopez.shinyapps.io/teorema_limite_central/**
