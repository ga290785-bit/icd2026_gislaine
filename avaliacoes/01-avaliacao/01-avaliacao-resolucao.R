# Arquivo: 01-avaliacao-resolucao.R
# Integrante 1: Eunice Oliveira
# Integrante 2: Gislaine Alves
# Integrante 3: Jenifer Xavier
# Integrante 4: Tatiane Arantes
# Data: 28/04/2026
# Objetivo: Resolução da Avaliação 1 — Introdução à Ciência de Dados


# Configurações globais -----------------------------------------------

options(digits = 5, scipen = 999)

# carrega os pacotes usados (Exercício 1)

library(here) # para usar caminhos relativos
library(tidyverse) # carrega o dplyr, readr, ggplot2, etc.
library(janitor) # para limpar os nomes das colunas


# Exercício 1 -----------------------------------------------------------

# importa o arquivo agencias.csv

# define o caminho relativo do arquivo usando a função here():
caminho_agencias <- here ("dados/brutos/agencias.csv")
  
# importa o arquivo com a função read_csv:
dados_agencias <-  read_csv(caminho_agencias)

# inspeciona a estrutura do objeto
glimpse(dados_agencias)


# importa o arquivo credito_trimestral.csv

# define o caminho relativo do arquivo usando a função here():
caminho_trimestral <- here ("dados/brutos/credito_trimestral.csv")
  
# importa o arquivo com a função read_csv:
dados_trimestral <-  read_csv(caminho_trimestral)
  
# inspeciona a estrutura do objeto
glimpse(dados_trimestral) 
  
  # Exercício 2 ----------------------------------------------------------

# 2.a)
dados_agencias |>
  filter(tipo_agencia == "Plena")


# 2.b)
ranking_cooperados <- dados_agencias |> 
  select(nome_agencia, cidade, num_cooperados) |> 
  arrange(desc(num_cooperados))

# Exibe o resultado no console
print(ranking_cooperados)


# 2.c)
dados_agencias |> 
  filter (cidade == "Divinópolis" , num_cooperados) >


# Exercício 3 ---------------------------------------------------------

# 3.a) pivot_longer

# reorganiza os dados de crédito em trimestre e volume_credito
dados_credito_longo <- 
  
  # 3.b) left_join
  
  # combina `dados_credito_longo`com `dados_agencias`
  dados_completos <-
  
  
  
  # Exercício 4 ---------------------------------------------------------

# cria dados_analise com credito_por_cooperado
dados_analise <- 
  
  # resume por cidade e ordena por volume_total
  dados_analise |>
  
  
  # Resposta do Exercício 4:
  
  # Cidade com maior volume_total:
  # Cidade com maior media_dos_creditos_por_cooperado:
  
  
  
  # Exercício 5 ---------------------------------------------------------

# classifica nivel_credito e resume por tipo_agencia
resumo_por_tipo <- 