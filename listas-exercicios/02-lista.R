# Arquivo: 02-lista.R
# Autor(a): <Gislaine Alves>
# Data: <07/04/2026>
# Objetivo:
# 1. Resolver os exercícios da lista 2


# Configurações globais ---------------------------------------------------

# Configura o número de dígitos a serem exibidos
options(digits = 5, scipen = 999)

# carrega os pacotes necessários

library(here) # para usar caminhos relativos
library(tidyverse) # carrega o dplyr, readr, ggplot2, etc.
library(janitor) # para limpar os nomes das colunas

# Exercicio 1 -------------------------------------------------------------

## b) define o caminho relativo do arquivo de dados
dados_marketing.csv <- read_csv(here("dados", "brutos","dados-marketing.csv"))

## c) exibe uma visão compacta do objeto
glimpse(dados_marketing.csv)


# Exercicio 2 -------------------------------------------------------------

## a) Cada linha do arquivo representa uma semana de observação.
## As observações não correspondem a vendas individuais, mas a registros semanais
## com informações sobre investimentos em diferentes canais de marketing, 
## ocorrência de promoção, atividade concorrente e receita de vendas.

## b) As observações são as linhas enumeradas em 156 e as Variáveis dão as colunas
## enumeradas em 9.


# Exercicio 3 -------------------------------------------------------------

## a) padronizar os nomes das colunas e criar um novo objeto:
dados_marketing_limpos <- dados_marketing |>
  # limpa os nomes das colunas/variáveis
  clean_names() |>


## b)escreva, execute e verifique os nomesdas variáveis/colunas.
 names(dados_marketing_limpos)



# Exercicio 4 -------------------------------------------------------------
# seleciona apenas as colunas data, mes, gasto_tv, gasto_radio, promoção
# e receita_vendas:
dados_marketing_limpos |> 
  select(data, mes, gasto_tv, gasto_radio, promocao, receita_vendas)


# Exercicio 5 -------------------------------------------------------------
# Use mutate() para criar uma nova variável chamada gasto_total no objeto 
# dados_marketing_limpos, correspondente à soma dos gastos com gasto_tv, 
# gasto_radio, gasto_redes_sociais, gasto_email:
dados_marketing_limpos |> 
  mutate(gasto_total = gasto_tv, gasto_radio, gasto_redes_sociais, gasto_email)

# mostra as colunas solicitadas
dados_marketing_limpos |>
  select(data, mes, gasto_total, receita_vendas)

# visualiza o objeto no RStudio
View(dados_marketing_limpos)


# Exercicio 6 -------------------------------------------------------------

# cria duas novas variaveis com nomes mais descritivos
dados_marketing_limpos <- dados_marketing_limpos |>
  mutate(
    status_promocao = ifelse(promocao == 1, "Com promoção", "Sem promoção"),
    status_concorrencia = ifelse(
      atividade_concorrente == 1,
      "Com concorrência",
      "Sem concorrência"
    )
  )

# mostra as novas variaveis
dados_marketing_limpos |>
  select(promocao, status_promocao, atividade_concorrente, status_concorrencia)

# visualiza o objeto no RStudio
View(dados_marketing_limpos)



# Exercicio 7 -------------------------------------------------------------




# Exercicio 8 -------------------------------------------------------------





# Exercicio 9 -------------------------------------------------------------