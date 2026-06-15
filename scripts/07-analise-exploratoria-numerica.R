# Arquivo: 07-analise-exploratoria-numerica.R
# Autor(a): GISLAINE A
# Data: 15/06/2026
# Objetivos:
# 1. Carregar e inspecionar os dados de marketing
# 2. Calcular estatísticas amostrais de centro, posição e variabilidade
# 3. Interpretar a receita semanal com base nos dados observados

# 0. Pacotes e opções globais --------------------------------------------

# Opções de exibição numérica
options(digits = 5, scipen = 999)

# Pacotes usados nesta aula
library(here)
library(tidyverse)

# 01. Carregamento de Dados ----------------------------------------------

# Caminho do arquivo de dados limpos
caminho_dados <- here("dados/limpos/dados_marketing_limpos.rds")

# Leitura dos marketing
dados_marketing <- read_rds(caminho_dados)

# Estrutura dos dados carregados
glimpse(dados_marketing)


# 02. Inspeção inicial ----------------------------------------------------

# Dimensões da Base
dim(dados_marketing)

# Nomes das variáveis
names(dados_marketing)

# Primeiras linhas da Base
head(dados_marketing)

#   Contagem de semanas por status  de promoção
dados_marketing |> 
  count(status_promocao)


# 03. Valores Típicos da Receita ------------------------------------------

# Resumo com medidas amostrais de Centro
estatisticas_centro <- dados_marketing |> 
  summarise(
    # Média Amostral
    media = mean(receita_vendas),
    
        # Mediana Amostral
    mediana = median(receita_vendas))

# Exibe o Resumo calculado
estatisticas_centro


# 04. Resumo Rápido da Receita --------------------------------------------

# Extrai a coluna  receita_vendas com um vetor
receita <- dados_marketing |> 
  pull(receita_vendas)

# Resumo amostral básico

summary(receita)
summary(dados_marketing $ status_promocao)
df <- 
dados_marketing |> 
  mutate(promocao = factor(status_promocao))

# PARA VARIAVEIS DISCRETAS
summary(df$promocao)







