# Arquivo: 05-probabilidade.R
# Autor: Gislaine Alves
# Data: 11/05/2026
# Objetivos:
# 1. Praticar cálculos básicos de probabilidades
# 2. Praticar conceitos básicos de simulação de Monte Carlo

# Configuracoes globais -----------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)


# Pacotes usados ------------------------------------------------------

library(tidyverse)
library(probs) # instale esse pacote

# Solução do Exemplo 1:
# 4 funções tosscoin simula o lancamento de moedas
# Simula o lançamento de 3 moedas
# espaço amostral do lançamento de uma moeda 2 vezes
tosscoin(times = 3)

# Solução do Exemplo 2:
# Em R, a função choose(n, k) calcula o número de combinações possíveis:
# para exibir os números sem notação científica
options(scipen = 999)

choose(60,6)

# Assim, a probabilidade de ganhar o prêmio principal da megasena fazendo uma aposta é 1/50.063.860, ou:
# para exibir os números sem notação científica
options(scipen = 999)

# prob. de acertar os 6 números da megasena com 1 aposta
1/choose(60,6)

# A função sample() sorteia elementos de um conjunto de forma aleatória.
# lançamentos de moedas e dados, sorteios, escolhas de clientes, 
# seleção de unidades em uma auditoria etc.

sample(x, size, replace = FALSE, prob = NULL)

# Simulando o lancamento de um dado:
# fixa a semente para reprodutibilidade
set.seed(123)

# cria um vetor de 1 até 6 (faces)
dado <- 1:6                                 

# define o n. de lançamentos do dado
n <- 10 

# simula os 10 lançamentos
lançamentos <- sample(dado, size = 10, replace = TRUE)
lançamentos

# calcula o valor médio dos 10 lançamentos
# O valor esperado1 representa o valor médio que esperamos 
# observar em muitas repetições do mesmo experimento aleatório
mean(lançamentos)  # média observada

# exercicios:
# fixa a semente para reprodutibilidade
set.seed(123)

# define o n. de lançamentos do dado
n <- 10 

# simula os n lançamentos
lançamentos <- sample(dado, size = 10, replace = TRUE)

# calcula o valor médio dos 10 lançamentos
mean(lançamentos)  # média observada





















