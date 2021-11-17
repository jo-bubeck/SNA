## ========================================================##
##                                                         ##
##   tidygraph basics task                                 ##
##   dhbw R workshop by Philipp Mendoza                    ##
##                                                         ##
##   Email: p.m.mendoza@uva.nl                             ##
##   Twitter: @philipp_mendoza                             ##
##                                                         ##
## ========================================================##

## Loading packages ----
# Installiere (falls notwendig) und lade die Pakete: tidyverse, tidygraph, tidylog und ggraph!
# Benütze für die Installation auch das argument `dependencies = T`
library('tidyverse')
library('tidygraph')
library('tidylog')
library('ggraph')
library('networkD3')
library('tinytex')

## Importing data ----
# use read_csv() import the nodes and edges csv files from here: 
edges <- read_csv('Data/02_edges_test.csv')
nodes <- read_csv('Data/02_nodes_test.csv')


## Inspecting data ----
# check how the data is build up, whether we need to clean anything.
head(edges)
head(nodes)

is.na(edges)
is.na(nodes)

summary(edges)
summary(nodes)

## Cleaning data ----
# in case this is necessary, clean the data here
edges <- edges %>%
  mutate(from = `from,to` %>% substr(1,1),
         to = `from,to` %>% substr(3,3), ) %>%
  select(-`from,to`)


## Creating graph object ----
nodes <- nodes %>%
  mutate(
    pop = seq(2, 12)
  )

edges <- edges %>% 
  mutate(
    weighting = c(2,5,4,2,6,4,2,5,6,1)
  )

## Creating a graph visualisation ----
net <- tbl_graph(nodes, edges)

net %>% 
  activate(nodes) %>% 
  mutate(
    pop2 = pop*2
  )

 plot(net)



