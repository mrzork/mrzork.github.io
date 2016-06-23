library(ggvis)
library(dplyr)

head(mtcars)

mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()

mtcars %>% 
  ggvis(~wt, ~mpg) %>% 
  layer_points(size := 25, shape := "diamond", stroke := "red", fill := NA)

# lineas regresion

mtcars %>% 
  ggvis(~wt, ~mpg) %>%
  layer_points() %>%
  layer_smooths()

# con IC

mtcars %>% 
  ggvis(~wt, ~mpg) %>%
  layer_points() %>%
  layer_model_predictions(model = "lm", se = TRUE)

# Coloring points by a variable:

mtcars %>% 
  ggvis(~wt, ~mpg) %>% 
  layer_points(fill = ~factor(cyl))

# Con lineas sobre cada grupo
mtcars %>% 
  ggvis(~wt, ~mpg, fill = ~factor(cyl)) %>% 
  layer_points() %>% 
  group_by(cyl) %>% 
  layer_model_predictions(model = "lm")


##tamaños

mtcars %>% ggvis(~mpg, ~disp, size = ~vs) %>% layer_points()


## graficos de barra

# The first few rows
head(pressure)


# basico
pressure %>% 
  ggvis(~temperature, ~pressure) %>%
  layer_bars()

# con ancho especifico

pressure %>% 
  ggvis(~temperature, ~pressure) %>%
  layer_bars(width = 10)

##lineas

pressure %>% ggvis(~temperature, ~pressure) %>% layer_lines()

# lineas y puntos
pressure %>% ggvis(~temperature, ~pressure) %>%
  layer_points() %>% 
  layer_lines()

###histogramas

head(faithful)

faithful %>% ggvis(~eruptions) %>% layer_histograms()

##ajuste color
faithful %>% ggvis(~eruptions, fill := "#fff8dc") %>%
  layer_histograms(width = 0.25)

# boxplots

mtcars %>% ggvis(~factor(cyl), ~mpg) %>% layer_boxplots()


###interaccion 

mtcars %>% 
  ggvis(~wt, ~mpg, 
        size := input_slider(10, 100),
        opacity := input_slider(0, 1)
  ) %>% 
  layer_points()
