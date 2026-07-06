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


# 05. Quantis da Receita --------------------------------------------------

# Quantis amostrais selecionados
quantis_receita <- dados_marketing |> 
  summarise(
    # Mínimo amostral percentil 5
    p0 = quantile(receita_vendas, 0),
    p5 = quantile(receita_vendas, 0.05),
    
    # Quartis amostrais
    q1 = quantile(receita_vendas, 0.25),
    mediana = quantile(receita_vendas, 0.50),
    q3 =quantile(receita_vendas, 0.75),
    
    # Percentil 95 e máxima amostral
    p95 = quantile(receita_vendas, 0.95),
    p100 = quantile(receita_vendas, 1)
  )

# Exibe os quantis calculados
quantis_receita


# 06. Variabilidade da Receita --------------------------------------------

# Resumo com medidas amostrais de variabilidade
estatisticas_variabilidade <- dados_marketing |> 
  summarise(
    # Amplitude amostral
    amplitude = max(receita_vendas) - min(receita_vendas),
    
    # Variancia amostral
    variancia = var(receita_vendas),
    
    # Desvio-padrão amostral
    desvio_padrao = sd(receita_vendas),
    
    # Intervalo Interquartil amostral
    iqr = IQR(receita_vendas)
    )

# Exibe o resumo calculado
estatisticas_variabilidade


# 07. Coeficiente de variação ---------------------------------------------

# Resumo com média, devio-padrão e Cv amostrais
cv_receita <- dados_marketing |> 
  summarise(
    
    # Média amostral
    média = mean(receita_vendas),
    
    # Desvio-padrao Amostral
    desvio_padrao = sd(receita_vendas),
    
    # CV amostral percentual
    cv_percentual = 100 * desvio_padrao / media
  )

# Exibe o coefinte de variação
cv_receita




































