# Arquivo: 03-lista.R
# Autor(a): GISLAINE ALVES
# Data: 14/04/2026
# Objetivo: Resolução da Lista de Exercícios 3

# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)

# Carrega os pacotes necessários
library(here)
library(tidyverse)


# Exercício 1 ------------------------------------------------

## a Define o caminho relativo do arquivo
caminho_receitas <- here("dados/brutos/receitas_trimestres.csv")

# importa o arquivo com read_csv
dados_receitas <- read_csv(caminho_receitas)


## b
glimpse(dados_receitas)


## c
# comentário:
# a tabela está em formato desorganizado para análise porque os trimestres
# (T1,T2,T3,T4) são valores de variável trimestre, mas parecem como 
# nomes de colunas.


## d Transforma receitas para o formato longo
receitas_longas <-  dados_receitas |> 
  pivot_longer(
    cols = c("T1", "T2", "T3", "T4"),
    names_to = "trimestre",
    values_to = "receita"
  )

# exibir o resultado
glimpse(receitas_longas)


## e
View(receitas_longas)



# Exercício 2 ------------------------------------------------


## a


## b


## c


## d


## e



# Exercício 3 ------------------------------------------------


## a


## b


## c


## d


## e


## f


## g


## h


## i