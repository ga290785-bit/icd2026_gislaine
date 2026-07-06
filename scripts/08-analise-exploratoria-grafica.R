# Arquivo: 08-analise-exploratoria-grafica.R
# Autor(a): Gislaine
# Data: 22/06/2026
# Objetivos:
# 1. Criar histograma da receita semanal de vendas com tidyplots
# 2. Criar boxplot da receita semanal de vendas com tidyplots
# 3. Criar boxplot comparativo da receita semanal de vendas com tidyplots
#    entre semanas com e sem promoção

# 0. Pacotes e opções globais --------------------------------------------

# Opções de exibição numérica
options(digits = 5, scipen = 999)

# Pacotes usados nesta aula
library(here)
library(tidyverse)
library(tidyplots)

# Importação de Dados -----------------------------------------------------

